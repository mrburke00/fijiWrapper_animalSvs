#!/bin/sh
eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda init
conda config --add channels bioconda
#conda install pysam
conda activate snakemake
source /scratch/Shares/layer/workspace/devin_sra/config_env.sh
