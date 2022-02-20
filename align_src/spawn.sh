#!/bin/bash

sra_file="/scratch/Shares/layer/workspace/devin_sra/sv_step/pigs.txt"
#sra_file="pigs.txt"
procs=4
lines=$(wc -l $sra_file | cut -d " " -f 1)
x=$((lines / procs))
cat $sra_file | gargs -log my.log --n $x -p $procs "sbatch align.sbatch {}"

