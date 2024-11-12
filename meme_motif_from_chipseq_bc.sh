#!/bin/bash
# define motif use meme from MACS2 peak file

wd=$1
f=$2
#wd=/home/greenblattlab/shuyepu/Nabeel/ChIPseq/Greenblatt_ChIP/results_output/macs2_results
cd ${wd}

genome=~/hg19/human.hg19_sorted.genome
fasta=~/hg19/hg19.fa

	
	echo -e "\n\nProcessing ${f}"
	basef=$(basename "${f}" .bed)

	extbed=${basef}_extended.bed
	
	echo "Extending bed ..."
	bedtools slop -s -l 50 -r 50 -g ${genome} -i ${f} > ${extbed}
	echo "Getting DNA sequence ..."
	bedtools getfasta -fi ${fasta} -bed ${extbed} -fo ${extbed}.fa

	memed=${basef}_l50r50_motif/
	mkdir -p ${memed}
	np=8
	echo "Running MEME ..."
	submitjob -c $np -w 500 -m 100 meme-chip ${extbed}.fa -dna -meme-nmotifs 5 -meme-mod oops -meme-p $np -minw 6 -maxw 20 -oc ${memed}
	#submitjob 100 -m 256 dreme -p ${extbed}.fa -mink 6 -maxk 20 -m 5 -dna -oc $memed




