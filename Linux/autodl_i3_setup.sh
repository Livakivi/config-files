#!/bin/bash

# Temporary directory to clone the repository
temp_dir=$(mktemp -d)
repo_url="https://github.com/Livakivi/config-files.git"

# Clone the repository
git clone $repo_url $temp_dir

# Move folders from the cloned repository to .config directory
mv $temp_dir/Linux/.config/* ~/.config/
mkdir -p ~/Documents/wallpapers
mv $temp_dir/Wallpapers/* ~/Documents/wallpapers/
mkdir -p ~/scripts
mv $temp_dir/Linux/scripts/* ~/scripts/
chmod +x ~/scripts/*

# Clean up - remove the temporary directory
rm -rf $temp_dir
