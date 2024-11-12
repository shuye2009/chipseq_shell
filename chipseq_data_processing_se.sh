#!/usr/bin/bash

prefix=$1
inputs=$2
index=$3

if [ $# -eq 0 ] 
then
echo "usage: chipseq_data_processing.sh <output prefix> <comma-separated input list> <index>"
exit
fi

bowtie2 -x $index -U $inputs -S ${prefix}.sam

#samtools view -bS $1.sam > $1.bam
#rm $1.sam
#echo "sorting sam for $1"
#samtools sort -o $1.sorted.bam -T /dev/shm/cache_$1 $1.bam
#echo "creating index for $1"
#rm $1.bam
#samtools index $1.sorted.bam

chipseq_alignment_postprocess_se.sh ${prefix}.sam
