#!/bin/bash
#SBATCH -p long # Partition or queue. In this case, short!
#SBATCH --job-name=devin_slurm_test # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=debu7497@colorado.edu
#SBATCH --nodes=1 # Only use a single node
#SBATCH --ntasks=16 # Run on a single CPU
#SBATCH --mem=32gb # Memory limit
#SBATCH --time=168:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/layer/workspace/devin_sra/sv_step/align_src/log_align/slurm_align_%j.out # Standard output and error log
#SBATCH --error=//scratch/Shares/layer/workspace/devin_sra/sv_step/align_src/log_align/slurm_align_%j.err # %j inserts job number
pwd; hostname; date
bash align.sh $@

sleep 20
date
