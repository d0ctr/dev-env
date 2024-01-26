#!/bin/bash

# Define repository URL
repository="https://github.com/d0ctr/dev-env"

# Define destination path
destination_path="$HOME/.local/bin"

# Create destination folder if it doesn't exist
mkdir -p "$destination_path"

# Clone the repository
git clone "$repository" temp_repo

# Move to the repository folder
cd temp_repo || exit

# Copy the contents of the bin folder to the destination
cp -r bin/* "$destination_path"

# Move back to the previous directory
cd ..

# Cleanup - remove the cloned repository
rm -rf temp_repo
