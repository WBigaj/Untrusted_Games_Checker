#!/bin/bash

#S1 is file with the PlayerList

outputFile="$(date +"%Y-%m-%d-%H-%M-%S")-Results.txt"

while IFS= read -r line || [[ -n "$line" ]]; do
    echo "Checking $line ...";
    if [ "$(./CheckProfile.sh $line)" == "$line" ]; then
        echo $line >> $outputFile
    fi
done < $1