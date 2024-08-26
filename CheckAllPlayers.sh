#!/bin/bash

#S1 is file with the PlayerList

outputFile="$(date +"%Y-%m-%d-%H-%M-%S")-Results.txt"
noGamesMessage='No (possible) new games'

while IFS= read -r line || [[ -n "$line" ]]; do
    echo "Checking $line ...";
    if [ "$(./CheckProfile.sh $line)" == "$line" ]; then
        echo $line >> $outputFile
    fi
done < $1

if ! [ -f $outputFile ]; then
    echo $noGamesMessage > $outputFile
fi