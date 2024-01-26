#!/bin/bash

NO_FORMAT="\033[0m"
C_YELLOW="\033[38;5;11m"
C_GREEN="\033[38;5;2m"


spin() {
  local spin_chars="⡿⢿⣻⣽⣾⣷⣯⣟"
  local i=0
  while [ true ]; do
    printf "\rInstalling ${C_YELLOW}${spin_chars:i++%8:1}${NO_FORMAT} "
    sleep 0.1
  done
}

# Define repository URL
repository="https://github.com/d0ctr/dev-env"

# Define destination path
destination_path="$HOME/.local/bin"

spin &
spinner=$!

# Create destination folder if it doesn't exist
mkdir -p "$destination_path"

# Clone the repository
git clone "$repository" temp_repo 2> /dev/null

# Move to the repository folder
cd temp_repo || exit

# Copy the contents of the bin folder to the destination
cp -r bin/* "$destination_path"

# Move back to the previous directory
cd ..

# Cleanup - remove the cloned repository
rm -rf temp_repo

kill $spinner &> /dev/null
echo -e "\b\b${C_GREEN}✓${NO_FORMAT}"