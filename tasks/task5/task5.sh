#!/bin/bash
# cd Linux/tasks/task5
read -p "Enter the Path:" $r1                      #the -p is used to read the open file descriptor
# read -p "Please Enter the file to update:" $r2
# hhhh=$(readlink "${r1}")


git add .
git commit -m "updating the remote repo"
git push origin main
   

#    #!/bin/bash

# # Prompt the user for the path to the file
# read -p "Enter the Path: " r1

# # Prompt the user for the specific file to update within that path
# read -p "Please Enter the file to update: " r2

# # Combine the path and the file name
# file_path="${r1}/${r2}"

# # Add the specified file to the staging area
# git add "$file_path"

# # Commit the change with a message
# git commit -m "updating the remote repo"

# # Push the changes to the main branch
# git push origin main
