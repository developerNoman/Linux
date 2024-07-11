#!/bin/bash

# read -p "Enter the Path: " r1
read -p "Please Enter the file to update: " r2
# cd "$r1" || exit
git add "$r2"
git commit -m "updating the remote repo"
git push origin main
