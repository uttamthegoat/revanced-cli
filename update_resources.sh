#!/bin/bash

# Function to download GitHub release assets
download_asset() {
    local repo_owner="$1"
    local repo_name="$2"
    local asset_pattern="$3"
    local output_file="$4"
    
    echo "Fetching latest release of ${repo_owner}/${repo_name}"
    api_url="https://api.github.com/repos/${repo_owner}/${repo_name}/releases/latest"
    
    # Get all download URLs
    download_urls=$(curl -s "$api_url" | grep -o "https://.*${asset_pattern}[^\"]*")
    
    # Filter out signature files
    download_url=$(echo "$download_urls" | grep -v "\.asc" | head -1)
    
    if [ -z "$download_url" ]; then
        echo "Error: Could not find download URL for ${asset_pattern}"
        exit 1
    fi
    
    echo "Downloading: ${download_url}"
    if ! curl -# -L -o "$output_file" "$download_url"; then
        echo "Error: Download failed for ${asset_pattern}"
        exit 1
    fi
    echo "Saved as: ${output_file}"
}

# Step 1: Update revanced-cli
echo "=== Processing revanced-cli ==="
rm -f revanced-cli.jar  # Delete existing file
download_asset "ReVanced" "revanced-cli" "revanced-cli-[0-9.]*-all\.jar" "temp.jar"
mv temp.jar revanced-cli.jar

# Step 2: Update patches
echo -e "\n=== Processing patches ==="
rm -f patches.rvp  # Delete existing file
download_asset "ReVanced" "revanced-patches" "patches-[0-9.]*\.rvp" "temp.rvp"
mv temp.rvp patches.rvp

# Step 3: Update x-patches
echo -e "\n=== Processing x-patches ==="
rm -f x-patches.rvp  # Delete existing file
download_asset "inotia00" "revanced-patches" "patches-[0-9.]*\.rvp" "x-temp.rvp"
mv x-temp.rvp x-patches.rvp

echo -e "\nAll updates completed successfully!"