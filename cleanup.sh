#!/bin/bash

# Enable extended globbing for more pattern power
shopt -s extglob

echo "Starting cleanup..."

# Delete the file named exactly 'input.apk'
if [ -f "input.apk" ]; then
    echo "Deleting input.apk"
    rm -f "input.apk"
fi

# Delete all files ending in .keystore
echo "Looking for *.keystore files..."
find . -type f -name "*.keystore" -exec rm -f {} +

# Delete all directories ending with '-temporary-files'
echo "Looking for directories ending in '-temporary-files'..."
find . -type d -name "*-temporary-files" -prune -exec rm -rf {} +

echo "Cleanup complete."
