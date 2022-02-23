#!/bin/bash
#SBATCH -p short # Partition or queue. In this case, short!
#SBATCH --job-name=devin_slurm_test # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=debu7497@colorado.edu
#SBATCH --nodes=1 # Only use a single node
#SBATCH --ntasks=12 # Run on a single CPU
#SBATCH --mem=32gb # Memory limit
#SBATCH --time=23:59:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_run_pipeline/slurm_run_%j.out # Standard output and error log
#SBATCH --error=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_run_pipeline/slurm_run_%j.err # %j inserts job number
pwd; hostname; date


#bash run_pipeline.sh
#bash check_bams.sh
#snakemake -s sv_pipe/src/get_reference.smk --cores 12
snakemake -s sv_pipe/src/sra_align.smk --cores 12
sleep 20
date


