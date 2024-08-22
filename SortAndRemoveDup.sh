#!/bin/bash

#$1 is for the input file
#$2 is for the output file

cat  $1 | sort | uniq > $2