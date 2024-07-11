# # #!bin/bash
# # # git add .
# # # git commit -m 'some message'
# # # git push origin main

# # REPO_DIR="/Linux/tasks/task5"

# # cd "$REPO_DIR" || { echo "Repository directory not found"; exit 1; }

# # git add .
# # git commit -m 'some message'
# # git push origin main





# #!/bin/bash
# REPO_DIR="/Linux/tasks/task5"

# perform_git_operations() {
#     local repo_dir=$1
#     cd "$repo_dir" || return
#     git add .
#     while true; do
#         git commit -m "Aduhd" 
#     done
# }
# for repo_dir in "${repo_dirs[@]}"; do
#     perform_git_operations "$repo_dir" &
# done
# while true; do
#     sleep 15m # change 15 with any value
#     for repo_dir in "${repo_dirs[@]}"; do
#         cd "$repo_dir" || continue
#         git push origin main
#     done
# done
# "Automated commit: $(date '+%Y-%m-%d %H:%M:%S')"


#!/bin/bash

cd /Linux/task/task5

# Check the status of the repository
git_status=$(git status --porcelain)

# If there are changes, add, commit, and push
if [ ! -z "$git_status" ]; then
    # Stage all changes
    git add .

    # Commit changes with a generic message
    git commit -m "Automated commit"

    # Push changes to the remote repository
    git push origin main

    echo "Changes have been pushed to the remote repository."
else
    echo "No changes to commit."
fi
