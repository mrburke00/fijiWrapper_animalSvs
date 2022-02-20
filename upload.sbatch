#!/bin/bash
#SBATCH -p short # Partition or queue. In this case, short!
#SBATCH --job-name=devin_slurm_test # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=debu7497@colorado.edu
#SBATCH --nodes=1 # Only use a single node
#SBATCH --ntasks=16 # Run on a single CPU
#SBATCH --mem=32gb # Memory limit
#SBATCH --time=18:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_upload/slurm_upload_%j.out # Standard output and error log
#SBATCH --error=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_upload/slurm_upload_%j.err # %j inserts job number
pwd; hostname; date


#aws s3 sync sv_results/data/ s3://layerlabcu/sra/horseshoe_bat/

#aws s3 cp sv_results/human/data/100_human_sites.smoove.square.vcf.gz s3://layerlabcu/sra/VCF/

#prefetch SRR6508244
#fastq-dump --split-files SRR6508244

python sv_pipe/src/scripts/downloadS3.py


date
