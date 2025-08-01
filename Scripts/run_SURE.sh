#!/bin/bash

PYTHON_SCRIPT="./Experiments/sure_exp.py"
TARGET_MODEL="lmsys/vicuna-7b-v1.5"
EARLY_STOP=True
EOS_NUM=20
LOG_PATH="Logs/${TARGET_MODEL}/SURE"

# Create the log directory if it does not exist
mkdir -p "$LOG_PATH"

# Conditional flag for EARLY_STOP
EARLY_STOP_FLAG=""
if [ "$EARLY_STOP" = "True" ]; then
    EARLY_STOP_FLAG="--early_stop"
fi

# Function to find the first available GPU
find_free_gpu() {
    for i in {0..7}; do
        free_mem=$(nvidia-smi -i $i --query-gpu=memory.free --format=csv,noheader,nounits | awk '{print $1}')
        if [ "$free_mem" -ge 30000 ]; then
            echo $i
            return
        fi
    done

    echo "-1" # Return -1 if no suitable GPU is found
}

# Start the jobs with GPU assignment
FREE_GPU=-1
# Keep looping until a free GPU is found
while [ $FREE_GPU -eq -1 ]; do
    FREE_GPU=$(find_free_gpu)
    if [ $FREE_GPU -eq -1 ]; then
        sleep 5 # Wait for 5 seconds before trying to find a free GPU again
    fi
done
# Run the Python script on the free GPU
(
    echo "Task running on GPU $FREE_GPU."
    CUDA_VISIBLE_DEVICES=$FREE_GPU python -u "$PYTHON_SCRIPT" --target_model $TARGET_MODEL --max-new-tokens 256 $EARLY_STOP_FLAG --eos_num $EOS_NUM > "${LOG_PATH}/${FEW_SHOT_NUM}.log" 2>&1
    echo "Task on GPU $FREE_GPU finished."
) &
# Wait for 30 seconds to give the GPU some time to allocate memory
sleep 30


# Wait for all background jobs to finish
wait
