#!/usr/bin/bash

if [ $# -lt 1 ]; then
 echo "usage: chipseq_alignmetn_postprocess_pe.sh <input sam file>"
 exit 1
fi

set -o pipefail

basef=$(basename "$1" ".sam")
basef=$(basename "$basef" ".bam")

## sort by name, which is required for fixmate, output uncompressed with -u
samtools sort -n -u -@2 -T /dev/shm/name_$1 $1 | \
## add ms and MC tags which are required by markdup with -m option
samtools fixmate -u -m - - | \
## sort by coordinates which is required by markdup
samtools sort -u -@2 -T /dev/shm/seq_$1 - | \
## remove duplicates with -r option and output stats with -s option
samtools markdup -@8 -r -s - - | \
## compress 
samtools view -@8 - -o ${basef}_dedup.bam 
## add index file
samtools index ${basef}_dedup.bam
