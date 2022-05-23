#!/bin/bash
name=$(cat /scratch/Shares/layer/workspace/devin_sra/sv_step/config.yaml | shyaml get-value organism_name)
procs=$(cat /scratch/Shares/layer/workspace/devin_sra/sv_step/config.yaml | shyaml get-value no_align_jobs)
sra_file="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/sra_runinfos/"$name"_sraRuns.txt"
#procs=12
lines=$(wc -l $sra_file | cut -d " " -f 1)
x=$((lines / procs))
cat $sra_file | gargs --n $x -p $procs "sbatch align/align.sbatch {}"

