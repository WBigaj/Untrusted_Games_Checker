#!/bin/bash

#S1 is file to decrypt
#$2 is target file

gpg -d $1 > $2
