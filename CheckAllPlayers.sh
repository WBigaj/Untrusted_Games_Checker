#!/bin/bash

#S1 is decrypted file with the PlayerList
#$2 is file for the output

tmp1=$(mktemp /tmp/tmp.XXXX)

gpg -d $1 > $tmp1

while IFS= read -r line || [[ -n "$line" ]]; do
    echo "Checking $line ...";
    if [ "$(./CheckProfile.sh $line)" == "$line" ]; then
        echo $line >> $2
    fi
done < $tmp1

rm $tmp1