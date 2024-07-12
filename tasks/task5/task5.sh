#!/bin/bash

git_status=$(git status --porcelain)

if [ ! -z "$git_status" ]; then
    echo "$git_status"
    read -p "Enter the files to update: " -a files
    for file in "${files[@]}"
    do
        git add "$file"
    done
    read -p "enter the commit message : " r1
    git commit -m "$r1"
    git push origin main
    echo "Changes pushed to remote repository."
    
else
    echo "No commit."
fi
