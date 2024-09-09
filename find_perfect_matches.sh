#! /usr/bin/bash

# query=$1, subject=$2, output=$3
blastn -task blastn-short -query $1 -subject $2 -outfmt '6 std qlen' -perc_identity 100 | 
awk '$13 == $4 {print $0}' > $3

MATCH_COUNT=$(wc -l < $3)
echo "number of perfect matches is: $MATCH_COUNT"
