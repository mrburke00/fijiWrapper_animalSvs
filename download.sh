#aws s3 sync s3://layerlabsra/SRR7614629/ .
#gzip -d *fastq.gz
#mv *_L1_1.fastq SRR7614629_1.fastq
#mv *_L1_2.fastq SRR7614629_2.fastq

aws s3 cp s3://layerlabcu/ref/genomes/chicken/GCA_000002315.5_GRCg6a_genomic_chicken.fa GCA_000002315.5_GRCg6a_genomic_chicken.fa 

#aws s3 sync s3://layerlabsra/ref/genomes/chicken/ .
#gzip -d *fastq.gz
#mv *_L2_1.fastq SRR7614630_1.fastq
#mv *_L2_2.fastq SRR7614630_2.fastq



