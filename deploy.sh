#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t minimo

# Add generated content
cd public
git submodule update --remote --rebase
git add .

# Commit changes
msg="Site published on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push changes
git push origin master

# Return to project root
cd ..
