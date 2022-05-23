#!/bin/bash
#SBATCH -p sandbox # Partition or queue. In this case, short!
#SBATCH --nodelist=fijinode-48
#SBATCH --job-name=devin_slurm_test # Job name
#SBATCH --mail-type=ALL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=debu7497@colorado.edu
#SBATCH --nodes=1 # Only use a single node
#SBATCH --ntasks=64 # Run on a single CPU
#SBATCH --mem=500gb # Memory limit
#SBATCH --time=168:00:00 # Time limit hrs:min:sec
#SBATCH --output=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_run_pipeline/slurm_run_%j.out # Standard output and error log
#SBATCH --error=/scratch/Shares/layer/workspace/devin_sra/sv_step/log_run_pipeline/slurm_run_%j.err # %j inserts job number
pwd; hostname; date

ulimit -n 12288

bash run_pipeline.sh

#bash check_bams.sh $@

#snakemake -s sv_pipe/src/get_reference.smk --cores 12
#snakemake -s sv_pipe/src/sra_align.smk --cores 12

#cd sv_results/mouse/dirty_data
#aws s3 sync s3://layerlabcu/sra/mouse/ .

sleep 20
date


