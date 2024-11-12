#!/usr/bin/bash

if [ $# -lt 4 ]; then
 echo "usage: chipseq_data_processing_pe.sh <output prefix> <comma-separated R1 list> <comma-separated R2 list> <bowtie2 index>"
 exit 1
fi

# 1=output_prefix, 2=R1, 3=R2, 4=bowtie2 index e.g. $HOME/hg19/hg19
bowtie2 -p 5 --local -x $4 -1 $2 -2 $3 --fr -S $1.sam

#samtools view -bS -q 10 $1.sam > $1.bam
#echo "sorting sam for $1"
#samtools sort -T /dev/shm/cache_$1 -o ${1}_sorted.bam --threads 5 $1.bam
#echo "creating index for $1"
#samtools index ${1}_sorted.bam

chipseq_alignment_postprocess_pe.sh $1.sam
