#!/bin/bash
# cd Linux/tasks/task5
# read -p "Path: " r1                      #the -p is used to read the open file descriptor
# filePath="${r1}"
# git add "$filePath"
# git commit -m "updating the remote repository"
# git push origin main
   


   #!/bin/bash


read -p "Enter the Path: " r1
# read -p "Please Enter the file to update: " r2
# filePath="${r1}/${r2}"

git add .

git commit -m "updating the remote repo"

git push origin main