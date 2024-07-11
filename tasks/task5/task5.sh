# #!/bin/bash
# cd /Linux/task/task5
# git_status=$(git status --porcelain)
# if [ ! -z "$git_status" ]; then
#     git add .
#     git commit -m "updating the remote repo"
#     git push origin main
#     echo "Changes have been pushed to the remote repository."
# else
#     echo "No changes to commit."
# fi


#!/bin/bash
read -p "Please Enter Path:" $r1
 git add .
git commit -m "updating the remote repo"
git push origin main
   