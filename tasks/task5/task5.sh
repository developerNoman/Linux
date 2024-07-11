#!/bin/bash

# read -p "Enter the Path: " r1
# cd "$r1" || exit
# git status

git_status=$(git status --porcelain)

echo "$git_status"
read -p "Enter the file to update: " r2
# If there are changes, add, commit, and push
if [ ! -z "$git_status" ]; then
git add "$r2"
git commit -m "updating the remote repo"
git push origin main
echo "Changes have been pushed to the remote repository."
else
    echo "No changes to commit."
fi
