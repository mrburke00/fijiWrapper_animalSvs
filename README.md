# fijiWrapper_animalSvs
Fiji enabled wrapper for animals_svs pipeline 

Need to make `sv_results/data`, `sv_results/snakemake_conda`, `log_run_pipeline`, and `log_upload` directories

In progress: 

`run_pipeline.sh`:
  - holds snakemake calls (fiji functionable) 
  - need to change amount of cores, disk space, and paths
  
 `run_pipeline.sbatch`:
  - run this via `sbatch run_pipeline.sbtach` to execute on fiji 
  
