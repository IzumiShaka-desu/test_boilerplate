#!/bin/bash

# Check if inside a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository."
    exit 1
fi

# Get the list of modified or untracked files
files=$(git status --porcelain | awk '{print $2}')

if [ -z "$files" ]; then
    echo "No changes to commit."
    exit 0
fi

# Iterate through each file and prompt for commit
for file in $files; do
    echo "Do you want to commit the file: $file? (y/n)"
    read -r response
    if [[ "$response" == "y" || "$response" == "Y" ]]; then
        git add "$file"
        echo "Enter commit message for $file:"
        # read -r commit_message
        # git commit -m "$commit_message"
        git commit -m "init $file"
        echo "$file committed."
    else
        echo "$file skipped."
    fi
    echo "-------------------------"
done

# Display the Git log after committing
echo "Commit log:"
git log --oneline
