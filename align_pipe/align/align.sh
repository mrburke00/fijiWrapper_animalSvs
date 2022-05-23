#!/bin/bash
animal=$(cat /scratch/Shares/layer/workspace/devin_sra/sv_step/config.yaml | shyaml get-value organism_name)
#animal="chicken"
animal_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/$animal/"
data_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/$animal/data_test"
ref_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/$animal/ref"
bwa_errs="/scratch/Shares/layer/workspace/devin_sra/sv_step/align_pipe/align/bwa_errors"
sra_examples=("$@")
for i in "${!sra_examples[@]}"; do
	echo "${sra_examples[i]}"
	cd $data_dir
	mkdir "${sra_examples[i]}"
	cd "${sra_examples[i]}"

	prefetch "${sra_examples[i]}" --max-size 200G
	fastq-dump --split-files "${sra_examples[i]}"
        
	#mv "${sra_examples[i]}"_1.fastq data/fastqs/
	#mv "${sra_examples[i]}"_2.fastq data/fastqs/
	
	## fastq -> bam ##
	bwa mem -M -t 16 -R "@RG\tID:1\tSM:""${sra_examples[i]}" \
	$ref_dir/$animal \
	"${sra_examples[i]}"_1.fastq "${sra_examples[i]}"_2.fastq  \
	2> $bwa_errs/bwa_"${sra_examples[i]}".err \
	> "${sra_examples[i]}".bam
	
	#mv "${sra_examples[i]}".bam data/bams/	

	## sort bwa ##
	samtools sort "${sra_examples[i]}".bam -o "${sra_examples[i]}".sorted.bam -@16
	
	#mv "${sra_examples[i]}".sorted.bam data/bams/
	
	## index bam ##
	samtools index "${sra_examples[i]}".sorted.bam -@16

	#mv "${sra_examples[i]}".sorted.bam.bai data/bams/
	
	## upload to S3 ##
	#aws s3 cp data/bams/"${sra_examples[i]}".sorted.bam s3://layerlabcu/sra/$animal/
	#aws s3 cp data/bams/"${sra_examples[i]}".sorted.bam.bai s3://layerlabcu/sra/$animal/

	rm -r $data_dir/"${sra_examples[i]}"/"${sra_examples[i]}".bam
	rm -r $data_dir/"${sra_examples[i]}"/"${sra_examples[i]}"_1.fastq
	rm -r $data_dir/"${sra_examples[i]}"/"${sra_examples[i]}"_2.fastq
	rm -r $data_dir/"${sra_examples[i]}"/"${sra_examples[i]}"
	
done

