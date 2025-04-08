
# Revanced CLI Setup and Patching Guide

This guide will help you set up **revanced-cli** and download the necessary files to patch APKs like YouTube.

## Prerequisites
Before you start, ensure you have the following:
- **Java 11 or later** installed on your system. You can check if Java is installed with the command:
  ```bash
  java -version
  ```
- A device with **ADB (Android Debug Bridge)** set up if you plan to install the patched APK on your Android device.

## Steps to Set Up **revanced-cli**

### 1. **Create a New Folder:**
   Create a new folder to store all the necessary files. For example:
   ```bash
   mkdir revanced-cli
   cd revanced-cli
   ```

### 2. **Download the `revanced-cli.jar` File:**
   Download the `.jar` file from the **revanced-cli** GitHub releases page:
   - Go to the [revanced-cli GitHub releases page](https://github.com/ReVanced/revanced-cli/releases).
   - Download the latest `.jar` file from the releases section and rename it to `revanced-cli.jar`
   - Move the `revanced-cli.jar` file to the `revanced-cli` folder

### 3. **Check if the `revanced-cli.jar` File Works:**
   Open your terminal or command prompt in the `revanced-cli` folder and run:
   ```bash
   java -jar revanced-cli.jar -h
   ```
   If the `revanced-cli.jar` file is working correctly, you should see a help message listing available commands.

### 4. **Download the `patches.rvp` File:**
   Download the `.rvp` file from the **revanced-patches** GitHub releases page:
   - Go to the [revanced-patches GitHub releases page](https://github.com/ReVanced/revanced-patches/releases).
   - Download the latest `.rvp` file and rename it to `patches.rvp`
   - Move the `patches.rvp` file to the `revanced-cli` folder

### 5. **Check if the `patches.rvp` File Works:**
   To verify that the patches are correctly loaded, run the following command:
   ```bash
   java -jar revanced-cli.jar list-patches --with-packages --with-versions --with-options patches.rvp
   ```
   This command should list all the available patches and options that are included in the `patches.rvp` file.

### 6. **Download the Required APK File:**
   Download the APK file of the app you want to patch (e.g., YouTube) from [ApkMirror](https://www.apkmirror.com/).
   - Check the [Revanced Patch Compatibility page](https://revanced.app/patches) to find out which version of the APK is compatible with the available patches.
   - After downloading the APK, rename it to `input.apk`
   - Move the `input.apk` file to the `revanced-cli` folder

### 7. **Patch the APK:**
   Now, you can patch the APK file using **revanced-cli**. Run the following command:
   ```bash
   java -jar revanced-cli.jar patch -p patches.rvp input.apk
   ```
   This will apply the patches from `patches.rvp` to the `input.apk` file. The patched APK will be saved as `output.apk` in the same directory.

   If you want to specify a different output file name, you can use the `-o` option:
   ```bash
   java -jar revanced-cli.jar patch -p patches.rvp input.apk -o patched-youtube.apk
   ```

### 8. **Install the Patched APK on Your Android Device (Optional):**
   After patching the APK, you can install it on your Android device using ADB:
   ```bash
   adb install patched-youtube.apk
   ```

   Make sure to enable **USB Debugging** on your Android device and connect it via USB.

## Troubleshooting
- If you run into issues with the `.jar` file not executing, ensure that you have the correct version of **Java** installed and that the file is named correctly.
- If there are compatibility issues with the patches, double-check that you're using the correct APK version compatible with the patches you're applying.

---

Let me know if you have any questions or run into issues during the setup!
```

---

### Summary of Steps in the README:

1. **Create a new folder** for your files.
2. **Download `revanced-cli.jar`** from the **revanced-cli GitHub** releases and rename it.
3. **Check the `.jar` file** works with `java -jar revanced-cli.jar -h`.
4. **Download `patches.rvp`** from the **revanced-patches GitHub** and rename it.
5. **Check if `patches.rvp` works** with the `list-patches` command.
6. **Download the required APK** (e.g., YouTube), ensure the version is compatible with the patches, and rename it to `input.apk`.
7. **Patch the APK** using the `patch` command.
8. **Install the patched APK** on your device (optional).

---

Feel free to customize it further, or let me know if you need any additional help!