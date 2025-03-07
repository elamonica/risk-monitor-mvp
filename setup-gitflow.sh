#!/bin/bash

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
  git init
  echo "Git repository initialized"
fi

# Add all files to git
git add .

# Make initial commit
git commit -m "Initial commit: Project setup"

# Create main branch
git branch -M main

# Create develop branch
git checkout -b develop
echo "Develop branch created"

# Create other GitFlow branches
git checkout -b feature/initial-setup develop
echo "Feature branch created"

# Optional: Add a .gitignore file
echo "node_modules
.tmp
.env
.cache
.strapi-updater.json
build
.DS_Store
.idea
" > .gitignore

git add .gitignore
git commit -m "Add .gitignore file"

# Return to develop branch
git checkout develop
git merge feature/initial-setup --no-ff -m "Merge feature/initial-setup into develop"

echo "GitFlow setup completed. Current branch: develop"