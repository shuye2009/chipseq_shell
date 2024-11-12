#!/bin/bash
wd=$1
index=$2
factor=$3
cd $wd

inputs=$(ls *${factor}*_R1_001.fastq.gz | tr "\n" ",")
	
submitjob -w 100 -m 20 $HOME/chipseq_script/chipseq_data_processing_se.sh ${factor} ${inputs} $index

