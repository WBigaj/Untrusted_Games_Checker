#!/bin/bash

#$1 is for the input file
#$2 is for the output file

while IFS= read -r line || [[ -n "$line" ]]; do
    echo ${line^^} >> $2
done < $1