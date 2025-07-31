# ReVanced-CLI Resource Updater

## Overview
This script automates the process of updating essential ReVanced components by fetching the latest releases directly from GitHub repositories. It handles downloading and organizing the core tools needed for patching applications with ReVanced.

## Components Updated
- **ReVanced CLI** (`revarced-cli.jar`): The command-line tool for patching applications
- **Official Patches** (`patches.vp`): Standard patches for YouTube and other apps
- **Extended Patches** (`x-patches.vp`): Additional patches maintained by inotia00

## Requirements
- `curl` command-line tool
- Internet connection
- Bash environment:
  - **Windows**: Use Git Bash, WSL, or Cygwin
  - **Linux/macOS**: Use the built-in terminal

## Installation
1. Save the script as `update_resources.sh`
2. Make it executable:
   ```bash
   chmod +x update_resources.sh
   ```

## Execution
Run the script using Bash:

```bash
./update_resources.sh
```

### Windows Users
If you're on Windows, execute this in a Bash-compatible terminal:
1. Open **Git Bash** or **WSL**
2. Navigate to the script directory
3. Run:
   ```bash
   ./update_resources.sh
   ```

## What the Script Does
1. Deletes any existing component files
2. Fetches the latest releases from GitHub
3. Downloads the newest versions
4. Renames files to standardized names
5. Provides status updates during the process

## Sample Output
```
=== Processing revanced-cli ===
Fetching latest release of ReVanced/revanced-cli
Downloading: https://github.com/.../revanced-cli-5.0.1-all.jar
Saved as: temp.jar

=== Processing patches ===
Fetching latest release of ReVanced/revanced-patches
Downloading: https://github.com/.../patches-2.220.0.rvp
Saved as: temp.rvp

=== Processing x-patches ===
Fetching latest release of inotia00/revanced-patches
Downloading: https://github.com/.../patches-2.220.0.rvp
Saved as: temp.rvp

All updates completed successfully!
```

## File Descriptions
| Output File        | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `revarced-cli.jar` | Main patching tool for modifying APK files                                  |
| `patches.vp`       | Official patches for YouTube, YouTube Music, and other supported apps      |
| `x-patches.vp`     | Extended patches with additional functionality (maintained by inotia00)    |

## Maintenance Tips
- Run the script regularly to keep components updated
- The script overwrites existing files automatically
- Temporary files (`temp.jar`, `temp.rvp`) are created during download and automatically renamed

## Troubleshooting
**Error: "Could not find download URL"**  
- Check asset names on GitHub:  
  ```bash
  curl -s https://api.github.com/repos/ReVanced/revanced-patches/releases/latest | grep -o "https://.*\.rvp"
  ```

**Permission denied error**  
- Make the script executable:  
  ```bash
  chmod +x update_resources.sh
  ```

**Curl SSL errors**  
- Temporary workaround (not recommended): Add `-k` to curl commands in the script

**Windows users**  
- Ensure you're using Git Bash or WSL, not Command Prompt or PowerShell
- Verify curl is installed in your Bash environment

## Recommended Workflow
1. Run the updater script
2. Use the downloaded components with ReVanced builder tools
3. Repeat weekly to get latest patches and features

Keep this script in your ReVanced working directory and run it before each patching session to ensure you're using the latest resources.