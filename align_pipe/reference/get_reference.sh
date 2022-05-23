#!/bin/bash


snakemake -s /scratch/Shares/layer/workspace/devin_sra/sv_step/align_pipe/reference/get_reference.smk \
          --cores 32 \
          --resources disk_mb=200000 \

