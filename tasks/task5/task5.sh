#!/bin/bash
# cd Linux/tasks/task5
read -p "Path: " $r1                      #the -p is used to read the open file descriptor
git add .
git commit -m "updating the remote repository"
git push origin main
   


