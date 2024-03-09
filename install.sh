#!/bin/sh

NO_FORMAT="\033[0m"
C_YELLOW="\033[38;5;11m"
C_GREEN="\033[38;5;2m"
C_RED="\033[38;5;9m"

spin() {
  local spin_chars="⡿⢿⣻⣽⣾⣷⣯⣟"
  local i=0
  trap 'echo -e "\b\b\033[0m"; exit' INT
  while true; do
    printf "\rInstalling ${C_YELLOW}${spin_chars:$((i++%8)):1}${NO_FORMAT} "
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
git_result=$(git clone "$repository" temp_repo 2>&1)
git_code=$?
if [ "$git_code" != "0" ]; then
  kill $spinner &> /dev/null
  echo -e "\b\b${C_RED}\xE2\x9C\x97${NO_FORMAT}"
  echo $git_result
  exit 1
fi 

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
