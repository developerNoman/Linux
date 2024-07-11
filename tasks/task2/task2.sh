#!/bin/bash
source="/home/noman/work/work1/"
key="am"
result="result.txt"

grep -rnw "$key" "$source" | tee "$result"
