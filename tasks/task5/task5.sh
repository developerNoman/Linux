#!/bin/bash
# cd Linux/tasks/task5
read -p "Enter the Path:" $r1                      #the -p is used to read the open file descriptor
git add .
git commit -m "updating the remote repo"
git push origin main
   


