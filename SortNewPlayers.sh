#!/bin/bash

#$1 is for the input file
#$2 is for the output file

tmp1=$(mktemp /tmp/tmp.XXXX)

#Format all letters to upper
while IFS= read -r line || [[ -n "$line" ]]; do
    echo ${line^^} >> $tmp1
done < $1

#Sort the list and remove non-unique entries
cat  $tmp1 | sort | uniq > $2

rm $tmp1