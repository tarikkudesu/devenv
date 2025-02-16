#!/bin/bash

echo -n "Enter project name: "
read project
echo -n "Enter the GitHub repository (leave empty for a local project): "
read repo

echo "Repository: $repo"
echo "Project Name: $project"

# Clone the 'devenv' repository into the project directory
if [ -z "$project" ]; then
    echo "Cloning 'devenv' repository into the current directory..."
    git clone git@github.com:tarikkudesu/devenv.git
    cd devenv
else
    echo "Cloning 'devenv' repository into project directory: $project"
    git clone git@github.com:tarikkudesu/devenv.git "$project"
    cd "$project"
fi

# If a GitHub repository URL is provided, clone it into 'data' directory
if [ -n "$repo" ]; then
    echo "Cloning $repo into the 'data' directory..."
    git clone "$repo" data
else
    echo "Creating 'data' directory as no repository URL was provided..."
    mkdir -p data
fi

rm -rf .git
