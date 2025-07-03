# Fix: `code .` Command Opens Wrong Program (VS Code vs Cursor IDE)

<!-- Language Selection -->
**🌐 Languages:** [English](#english) | [ไทย](README_TH.md)

---

## English

When Cursor IDE is installed, you may find that the `code .` command that previously opened Visual Studio Code (VS Code) now opens Cursor IDE instead. This guide explains the cause and provides solutions to make `code .` open VS Code again while setting up Cursor IDE to use the `cursor .` command.

## Problem Description

Both VS Code and Cursor IDE attempt to install command line tools that use the `code .` command for convenient project opening from Terminal or Command Prompt. When both programs are installed on the same machine, conflicts may occur causing the `code .` command to launch the program that was installed later or has higher priority in the system path.

**Example paths found:**

* **VS Code:** `C:\Program Files\Microsoft VS Code\bin`
* **Cursor IDE:** `c:\Users\[Username]\AppData\Local\Programs\cursor\resources\app\bin`

In this case, Cursor IDE has `code` and `code.cmd` files in its path, causing it to be executed when typing `code .`

## Solution

The fix involves two main parts: reordering the PATH and removing the conflicting command line tools from Cursor IDE.

### Step 1: Reorder Environment Variables (PATH)

To make the operating system find VS Code's command line tool before Cursor IDE's:

1.  **Open System Properties:**
    * Press `Windows + R`, type `sysdm.cpl` and press `Enter`
2.  **Access Environment Variables:**
    * Go to the "Advanced" tab and click "Environment Variables..."
3.  **Edit User PATH:**
    * In the "User variables for [your username]" section, select the `Path` variable and click "Edit..."
    * **Move the VS Code path (`C:\Program Files\Microsoft VS Code\bin`) up above the Cursor IDE path (`c:\Users\[Username]\AppData\Local\Programs\cursor\resources\app\bin`) using "Move Up"**
    * Click "OK" on all windows to save changes

### Step 2: Remove Conflicting Command Line Tools from Cursor IDE

Cursor IDE has `code` and `code.cmd` files that cause it to be executed when typing `code .`. We'll remove these files.

1.  **Open File Explorer:**
    * Navigate to Cursor IDE's path: `c:\Users\[Username]\AppData\Local\Programs\cursor\resources\app\bin`
2.  **Delete files related to the `code` command:**
    * In this folder, **delete the files named `code` (no extension) and `code.cmd`**
    * **Warning:** Make sure you're deleting files only from the **Cursor IDE** folder, never delete files from the VS Code folder!

### Step 3: Create `cursor .` Command for Cursor IDE (if not available)

If you don't have a working `cursor .` command, you can create a batch file to launch Cursor IDE:

1.  **Create a folder for batch files (if not existing):**
    * Create a new folder, e.g., `C:\Users\[Username]\bin`
    * **Important:** Add this folder's path (`C:\Users\[Username]\bin`) to the System Environment Variables (following Step 1 procedure)
2.  **Create `cursor.bat` file:**
    * Open Notepad or any text editor
    * Copy and paste this code:
        ```batch
        @echo off
        "c:\Users\[Username]\AppData\Local\Programs\cursor\resources\app\bin\cursor.cmd" %*
        ```
    * Save this file as `cursor.bat` in the folder created in step 1 (e.g., `C:\Users\[Username]\bin`)
    * Make sure to select "Save as type: All Files (*.*)" when saving

### Step 4: Test Commands

After completing all steps, close all open Command Prompt/PowerShell windows and open new ones to load the latest settings.

* **Test VS Code:**
    ```bash
    code .
    ```
    VS Code should open
* **Test Cursor IDE:**
    ```bash
    cursor .
    ```
    Cursor IDE should open

## Summary

After following these steps, you'll be able to use the `code .` command to open Visual Studio Code normally and the `cursor .` command to open Cursor IDE correctly. This will make your workflow more efficient and prevent confusion.

---

**Note:** Replace `[Username]` with your actual Windows username in all paths mentioned above.