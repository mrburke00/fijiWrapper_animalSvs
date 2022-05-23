#!/bin/bash

#snakemake -s /scratch/Shares/layer/workspace/devin_sra/sv_step/sv_pipe/src/genotype.smk --dag | dot -Tpdf > dag2.pdf

snakemake -s /scratch/Shares/layer/workspace/devin_sra/sv_step/sv_pipe/src/multisample.smk \
          --cores 64 \
	  --until AllCall \
          --resources disk_mb=500000 \
          --use-conda --conda-frontend mamba \
          --conda-prefix /scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/snakemake-conda \
          --scheduler greedy

snakemake -s /scratch/Shares/layer/workspace/devin_sra/sv_step/sv_pipe/src/genotype.smk \
          --cores 64 \
          --resources disk_mb=500000 \
          --use-conda --conda-frontend mamba \
          --conda-prefix /scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/snakemake-conda \
          --scheduler greedy
