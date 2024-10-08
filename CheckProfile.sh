#!/bin/bash

#$1 is for the player's name

tmp1=$(mktemp /tmp/tmp.XXX)

ProfileFileLocation="../PlayerFiles/$1"
PlayerPage="https://eu01.playuntrusted.com/profile/$1/"
NewPlayerFileContent=""

if ! [ -f $ProfileFileLocation ]; then
    echo $NewPlayerFileContent > $ProfileFileLocation
fi

lynx -dump $PlayerPage > $tmp1

CHANGE=$(cmp $tmp1 $ProfileFileLocation)
if [ -n "$CHANGE" ]; then
    cat < $tmp1 > $ProfileFileLocation;
    echo $1;
fi

rm $tmp1
