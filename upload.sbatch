#!/bin/bash
#SBATCH -p short # Partition or queue. In this case, short!
#SBATCH --job-name=devin_slurm_test # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=debu7497@colorado.edu
#SBATCH --nodes=1 # Only use a single node
#SBATCH --ntasks=4 # Run on a single CPU
#SBATCH --mem=8gb # Memory limit
#SBATCH --time=8:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_upload/slurm_upload_%j.out # Standard output and error log
#SBATCH --error=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_upload/slurm_upload_%j.err # %j inserts job number
pwd; hostname; date


aws s3 sync sv_results/data/ s3://layerlabcu/sra/horseshoe_bat/

date
