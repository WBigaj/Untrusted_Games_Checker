#!/bin/bash

#$1 is for the input file
#$2 is for the output file

tmp1=$(mktemp /tmp/tmp.XXXX)

./FileToUpper.sh $1 $tmp1
./SortAndRemoveDup.sh $tmp1 $2

rm $tmp1