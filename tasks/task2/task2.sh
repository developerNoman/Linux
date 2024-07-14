#!/bin/bash
read -p "Enter the source path: " source
key="am"
result="result.txt"

grep -rnw "$key" "$source" | tee "$result"
