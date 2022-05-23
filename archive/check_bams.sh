#!/bin/bash
#todo_file = "/scratch/Shares/layer/workspace/devin_sra/sv_step/chickens_todo.txt"
clean_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/mouse/data/"
dirty_dir="/scratch/Shares/layer/workspace/devin_sra/sv_step/sv_results/mouse/dirty_data/"

cd $dirty_dir

#for FILE in *; do 
#	echo ${FILE}
#	base="${FILE%%.*}"
#	if [ -f "$base".sorted.bam ]; then
#		echo "$base exists."
#		mv "$base".sorted.bam $clean_dir"$base".bam
#               samtools sort $clean_dir"$base".bam -o $clean_dir"$base".sorted.bam -@12
#		rm -r "$base".sorted.bam.bai
#		samtools index $clean_dir"$base".sorted.bam -@12
#		rm -r $clean_dir"$base".bam 
#		#might have to move the index file separately
#	fi
#done

sra_examples=("$@")
for i in "${!sra_examples[@]}"; do
        echo "${sra_examples[i]}"
	base="${sra_examples[i]%%.*}"
	echo "$base"
        if [ -f "$base".sorted.bam ]; then
                echo "$base exists."
		mkdir "$clean_dir"tmp_$base
                mv "$base".sorted.bam "$clean_dir"tmp_$base/"$base".bam
		cd  "$clean_dir"tmp_$base		
		samtools sort "$clean_dir"tmp_$base/"$base".bam -o $clean_dir"tmp_$base"/"$base".sorted.bam -@12
		mv $clean_dir"tmp_$base"/"$base".sorted.bam $clean_dir"$base".sorted.bam
		cd $dirty_dir
		rm -r "$clean_dir"tmp_$base
		rm -r "$base".sorted.bam.bai
                samtools index $clean_dir"$base".sorted.bam -@12
                rm -r $clean_dir"$base".bam
                #might have to move the index file separately
        fi
done

cd $clean_dir
rm -r test.txt
for FILE in *; do
	break
        base="${FILE%%.*}"
        if [ -f "$base".sorted.bam ]; then
                echo "$base exists."
 		if ! samtools view -H "$base".sorted.bam | grep -q "data/refs/horse"; then
			#rm -r $base.* 
			echo $base >> test.txt ; 
		else
			mkdir $base
			mv $base.* $base/
		fi
        fi
mv "$clean_dir"test.txt horse.txt
done


