#!/bin/bash
clean_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/pig/clean_data/"
cd sv_results/pig/data/

for FILE in *; do 
	break
	echo ${FILE} 
	base="${FILE%%.*}"
	if [ -f "$base".sorted.bam ]; then
		echo "$base exists."
		mv "$base".sorted.bam $clean_dir"$base".bam
                samtools sort $clean_dir"$base".bam -o $clean_dir"$base".sorted.bam -@12
		rm -r "$base".sorted.bam.bai
		samtools index $clean_dir"$base".sorted.bam -@12
		rm -r $clean_dir"$base".bam 
		#might have to move the index file separately
	fi
done
cd $clean_dir
rm -r test.txt
for FILE in *; do
	
        base="${FILE%%.*}"
        if [ -f "$base".sorted.bam ]; then
                echo "$base exists."
 		if ! samtools view -H "$base".sorted.bam | grep -q "data/refs/pig"; 
			then
			#rm -r $base.* 
			#echo $base >> test.txt ; 
		else
			mkdir $base
			mv $base.* $base/
			mv sv_results/pig/clean_data/test.txt pigs.txt
		fi
        fi
done


