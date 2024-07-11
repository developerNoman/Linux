#!/bin/bash
# cd Linux/tasks/task5
# read -p "Path: " r1                      #the -p is used to read the open file descriptor
# filePath="${r1}"
# git add "$filePath"
# git commit -m "updating the remote repository"
# git push origin main
   


   #!/bin/bash


# read -p "Enter the Path: " r1
# read -p "Please Enter the file to update: " r2
# filePath="${r1}/${r2}"

# git add "$filePath"

# git commit -m "updating the remote repo"

# git push origin main


#!/bin/bash

# read -p "Enter the Path: " r1
read -p "Please Enter the file to update: " r2

# Navigate to the specified path
# cd "$r1" || exit

# Add the specified file to the staging area
git add "$r2"

# Commit the changes with a message
git commit -m "updating the remote repo"

# Push the changes to the main branch
git push origin main
