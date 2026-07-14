# XLLM: Mind the Inconspicuous — Revealing the Hidden Weakness in Aligned LLMs’ Ethical Boundaries

## 1. Introduction

**XLLM** is the official implementation for the paper *Mind the Inconspicuous: Revealing the Hidden Weakness in Aligned LLMs’ Ethical Boundaries*. This repository provides tools and scripts for probing, attacking, and evaluating the ethical boundaries of large language models (LLMs) using various methods, including GCG, SURE, ICA, and GPTFuzzer.

## 2. Environment Setup

> **Note:** Running the code requires a GPU with at least 40GB memory for LLM inference and gradient computation (especially for GCG).

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd XLLM
   ```
2. (Recommended) Create and activate a virtual environment:
   ```bash
   conda create -n xllm python=3.8
   conda activate xllm
   ```
3. Install required packages:
   ```bash
   pip install -r requirements.txt
   ```
   *(If requirements.txt is missing, please add it or specify dependencies manually.)*

## 3. Directory Structure

- `Scripts/` — Shell scripts to run main experiments (GCG, SURE, ICA, GPTFuzzer).
- `Experiments/` — Python scripts for running and evaluating experiments.
- `BOOST/` — Core attack implementations and utilities:
  - `Attack_ICA/`, `Attack_GPTFuzzer/`, `Attack_GCG/` — Attack methods and helpers.
  - `utils/` — Utility modules (datasets, templates, constants).
- `Dataset/` — Datasets for probing and evaluation (harmful, harmless, Advbench, etc.).
- `Probing/` — Probing results and screenshots.
- `.gitignore`, `LICENSE.txt`, `README.md` — Standard project files.

## 4. Usage

All main running scripts are in the `Scripts` folder. For example:
```bash
bash ./Scripts/run_GCG.sh
bash ./Scripts/run_SURE.sh
bash ./Scripts/run_GPTFuzzer.sh
bash ./Scripts/run_ICA.sh
```
- Results are saved in the output specified by each script (create a `Logs` directory if needed).

## 5. Experiments

You can run or modify the experiment scripts in the `Experiments` folder:
- `ica_exp.py`
- `sure_exp.py`
- `gcg_exp.py`
- `fuzzer_exp.py`

## 6. Datasets

The `Dataset` folder contains:
- `harmful.csv`, `harmful_targets.csv`
- `Advbench_391_harm.csv`, `Advbench_391_harmless.csv`
- `fuzzer_seed.csv`, `Advbench.csv`

## 7. Probing

Probing screenshots and results are provided in the `Probing` folder (e.g., `screenshots.pdf`).

## 8. Citation

If you use XLLM in your work, please cite our paper:

```
@inproceedings{yu2025mind,
  title={Mind the Inconspicuous: Revealing the Hidden Weakness in Aligned $\{$LLMs$\}$'Refusal Boundaries},
  author={Yu, Jiahao and Luo, Haozheng and Hu, Jerry Yao-Chieh and Chen, Yan and Guo, Wenbo and Liu, Han and Xing, Xinyu},
  booktitle={34th USENIX Security Symposium (USENIX Security 25)},
  pages={259--278},
  year={2025}
}
```

## 9. Acknowledgements

This project is inspired by and builds upon various open-source works in LLM safety and evaluation.
- GPTFuzzer: https://github.com/sherdencooper/GPTFuzz
- GCG: https://github.com/llm-attacks/llm-attacks
