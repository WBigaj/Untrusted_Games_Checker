#!/bin/bash

#S1 is decrypted file with the PlayerList

tmp1=$(mktemp /tmp/tmp.XXXX)
outputFile="$(date +"%Y-%m-%d-%H-%M-%S")-Results.txt"

gpg -d $1 > $tmp1

while IFS= read -r line || [[ -n "$line" ]]; do
    echo "Checking $line ...";
    if [ "$(./CheckProfile.sh $line)" == "$line" ]; then
        echo $line >> $outputFile
    fi
done < $tmp1

rm $tmp1