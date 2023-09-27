#!/bin/bash

# Copy the .alias-collection directory to the home directory
cp -R .alias-collection ~/

# Check if the source file with alias commands exists
if [ -f "aliases" ]; then
    # Append the contents of the aliases to the .bashrc file
    cat aliases >> ~/.bashrc
    # Reload .bashrc to apply changes
    source ~/.bashrc
    echo "Alias commands appended to .bashrc and are now active"
else
    echo "Alias file 'aliases' not found"
fi