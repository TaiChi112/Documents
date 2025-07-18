# Git and GitHub Beginner's Guide (English)

<div align="center">

## 🌐 Language Selection / เลือกภาษา

[![🇺🇸 English (Current)](https://img.shields.io/badge/🇺🇸_English_(Current)-4CAF50?style=for-the-badge&logo=github)](README-EN.md) [![🇹🇭 THAI](https://img.shields.io/badge/🇹🇭_THAI_(Current)-FF5722?style=for-the-badge&logo=github)](README-TH.md)

---

*You are currently viewing the English version. Click the Thai button above to switch to Thai.*

*ขณะนี้คุณกำลังดูเวอร์ชันภาษาอังกฤษ คลิกปุ่มไทยด้านบนเพื่อเปลี่ยนเป็นภาษาไทย*

</div>

---

## Table of Contents

1. [Introduction to Git](#introduction-to-git)
2. [Basic Git Commands (Local Repository)](#basic-git-commands-local-repository)
3. [Introduction to GitHub](#introduction-to-github)
4. [Setting Up SSH Key for GitHub (First-Time Setup)](#setting-up-ssh-key-for-github-first-time-setup)
5. [Connecting Local Git to GitHub](#connecting-local-git-to-github)
6. [Cloning an Existing Repository](#cloning-an-existing-repository)
7. [Basic Collaboration Concepts](#basic-collaboration-concepts)
8. [Quick Reference](#quick-reference)

---

## Introduction to Git

### What is Git?

Git is a **version control system** - think of it as a super-powered "save" button for your code and projects. Imagine you're writing a story, and instead of just saving one version, you can save every draft, see what changed between versions, and even go back to any previous version whenever you want. That's what Git does for your code!

### Why do we use Git?
- **Track Changes:** See exactly what changed in your code and when
- **Backup:** Never lose your work - everything is saved with history
- **Collaboration:** Multiple people can work on the same project without conflicts
- **Experimentation:** Try new features without fear of breaking existing code
- **Professional Standard:** Every software company uses version control

---

## Basic Git Commands (Local Repository)

### 1. `git init` - Initialize a New Repository

This command creates a new Git repository in your current folder. Think of it as telling Git "start watching this folder for changes."

**Step by step:**
1. Open your terminal/command prompt
2. Navigate to your project folder: `cd your-project-folder`
3. Run: `git init`
4. You'll see: "Initialized empty Git repository"

**Example:**
```bash
cd my-awesome-project
git init
# Output: Initialized empty Git repository in /path/to/my-awesome-project/.git/
```

### 2. `git add` - Stage Changes

This command tells Git which files you want to include in your next save (commit). It's like putting items in a shopping cart before checkout.

**Commands:**
- `git add filename.txt` - Add a specific file
- `git add .` - Add all changed files in current directory
- `git add -A` - Add all changed files in the entire repository

**Example:**
```bash
# Add a specific file
git add index.html

# Add all files
git add .
```

### 3. `git commit` - Save Changes

This command saves your staged changes with a message describing what you did. It's like taking a snapshot of your project at this moment.

**Command:**
```bash
git commit -m "Your descriptive message here"
```

**Good commit message examples:**
- `git commit -m "Add login functionality"`
- `git commit -m "Fix bug in user registration"`
- `git commit -m "Update README with installation instructions"`

### 4. `git status` - Check Repository Status

This command shows you what's happening in your repository right now. It tells you:
- Which files have been changed
- Which files are staged (ready to commit)
- Which files are not being tracked by Git

**Command:**
```bash
git status
```

### 5. `git log` - View Commit History

This command shows you the history of all commits in your repository. It's like looking at a diary of all the changes you've made.

**Commands:**
- `git log` - Show full history
- `git log --oneline` - Show condensed history (easier to read)
- `git log -5` - Show only the last 5 commits

**Example:**
```bash
git log --oneline
# Output:
# a1b2c3d Add user authentication
# e4f5g6h Fix navigation bug
# i7j8k9l Initial project setup
```

---

## Introduction to GitHub

GitHub is a **cloud-based hosting service** for Git repositories. Think of it as Google Drive, but specifically designed for code projects. While Git works on your computer (locally), GitHub stores your code online and provides additional features.

### What GitHub provides:
- **Online Backup:** Your code is safely stored in the cloud
- **Collaboration:** Share your code with others and work together
- **Portfolio:** Showcase your projects to potential employers
- **Open Source:** Contribute to projects used by millions of people
- **Documentation:** Host websites and documentation for your projects

### Key Difference:
- **Git** = The tool that tracks changes on your computer
- **GitHub** = The online service that hosts your Git repositories

---

## Setting Up SSH Key for GitHub (First-Time Setup)

**Important for beginners:** Before connecting to GitHub, it's recommended to set up an SSH key for secure, password-free authentication. This is a one-time setup that makes your GitHub experience much smoother.

### What is an SSH Key?

An SSH key is like a digital "ID card" that proves you are who you say you are when connecting to GitHub. Instead of typing your password every time, your computer uses this special key to authenticate automatically.

**Benefits:**
- **No more passwords:** Push and pull without typing credentials
- **More secure:** Better security than password authentication
- **Convenient:** Works automatically once set up

### Step-by-Step SSH Key Setup

#### Step 1: Check if you already have an SSH key

Open your terminal and run:

```bash
ls -al ~/.ssh
```

If you see files like `id_rsa` and `id_rsa.pub` (or `id_ed25519` and `id_ed25519.pub`), you already have an SSH key. Skip to Step 3.

#### Step 2: Generate a new SSH key

If you don't have an SSH key, create one:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

**Replace `your_email@example.com` with your actual GitHub email address.**

When prompted:
1. **File location:** Press Enter to use the default location
2. **Passphrase:** You can press Enter for no passphrase, or enter a secure passphrase (recommended)

**Example output:**
```
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/username/.ssh/id_ed25519): [Press Enter]
Enter passphrase (empty for no passphrase): [Type passphrase or press Enter]
Enter same passphrase again: [Type passphrase again or press Enter]
```

#### Step 3: Add SSH key to ssh-agent

Start the ssh-agent and add your key:

```bash
# Start ssh-agent
eval "$(ssh-agent -s)"

# Add your SSH key
ssh-add ~/.ssh/id_ed25519
```

#### Step 4: Copy your public key

Copy your public key to clipboard:

**On Windows (Git Bash):**
```bash
clip < ~/.ssh/id_ed25519.pub
```

**On Mac:**
```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

**On Linux:**
```bash
cat ~/.ssh/id_ed25519.pub
# Then manually copy the output
```

#### Step 5: Add SSH key to GitHub

1. Go to [GitHub.com](https://github.com) and sign in
2. Click your profile picture (top-right corner)
3. Click **Settings**
4. In the left sidebar, click **SSH and GPG keys**
5. Click **New SSH key**
6. Give your key a title (e.g., "My Laptop" or "Work Computer")
7. Paste your key in the "Key" field
8. Click **Add SSH key**

#### Step 6: Test your SSH connection

```bash
ssh -T git@github.com
```

You should see a message like:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

**If you get a warning about authenticity:** Type "yes" and press Enter.

---

## Connecting Local Git to GitHub

### Step 1: Create a New Repository on GitHub

1. Go to [github.com](https://github.com) and sign in
2. Click the green "New" button or the "+" icon
3. Choose a repository name (same as your local folder is easiest)
4. Choose "Public" (visible to everyone) or "Private" (only you can see)
5. **Don't** check "Initialize this repository with a README" (we already have local files)
6. Click "Create repository"

### Step 2: Connect Your Local Repository

After creating the repository, GitHub will show you commands. **Choose the SSH option** if you set up an SSH key:

**Using SSH (Recommended if you set up SSH key):**
```bash
# Add GitHub as the remote origin (SSH)
git remote add origin git@github.com:yourusername/your-repo-name.git

# Rename your main branch to 'main' (GitHub's default)
git branch -M main

# Push your code to GitHub
git push -u origin main
```

**Using HTTPS (Alternative method):**
```bash
# Add GitHub as the remote origin (HTTPS)
git remote add origin https://github.com/yourusername/your-repo-name.git

# Rename your main branch to 'main' (GitHub's default)
git branch -M main

# Push your code to GitHub
git push -u origin main
```

**What each command does:**
- `git remote add origin`: Links your local repository to GitHub
- `git branch -M main`: Renames your current branch to "main"
- `git push -u origin main`: Uploads your code to GitHub and sets up tracking

**Note:** If you use HTTPS, you'll need to enter your GitHub username and password (or personal access token) each time you push.

### Step 3: Future Updates

After the initial setup, updating your GitHub repository is simple:

```bash
# 1. Check what changed
git status

# 2. Add your changes
git add .

# 3. Commit with a message
git commit -m "Describe what you changed"

# 4. Push to GitHub
git push
```

---

## Cloning an Existing Repository

### `git clone` - Download a Repository

When you want to work on someone else's project or download your own project to a new computer, you use `git clone`.

**Steps:**
1. Go to the GitHub repository page
2. Click the green "Code" button
3. Copy the URL (it looks like: `https://github.com/username/repo-name.git`)
4. Open your terminal
5. Navigate to where you want the project folder
6. Run the clone command

**Example:**
```bash
# Clone a repository
git clone https://github.com/username/awesome-project.git

# This creates a folder called "awesome-project" with all the code
cd awesome-project
```

### `git pull` - Update Your Local Repository

When working with others or when you've made changes on GitHub directly, you need to download the latest changes to your local computer.

**Command:**
```bash
git pull
```

**When to use it:**
- Before starting work each day
- When someone else has updated the project
- After making changes directly on GitHub (editing files online)

**Good practice:**
Always run `git pull` before making new changes, especially when working with others.

---

## Basic Collaboration Concepts

### Always Pull Before Push

This is the **golden rule** of Git collaboration:

```bash
# The safe workflow:
git pull          # Get latest changes first
git add .         # Stage your changes
git commit -m "Your message"
git push          # Send your changes
```

**Why this matters:**
If someone else changed the same files you're working on, you might get conflicts. Pulling first helps you handle these conflicts on your computer before pushing.

### Forking and Pull Requests (Future Learning)

These are advanced concepts for contributing to other people's projects:

**Forking:**
- Creates your own copy of someone else's repository
- Allows you to experiment without affecting the original
- Like making a photocopy of a book to write notes in

**Pull Requests:**
- A way to suggest changes to the original project
- Lets the project owner review your changes before accepting
- Like submitting a research paper for review before publication

---

## Quick Reference

### Essential Commands

```bash
# Setup (do once)
git init                    # Start new repository
git remote add origin URL   # Connect to GitHub

# Daily workflow
git status                  # Check what changed
git add .                   # Stage all changes
git commit -m "message"     # Save changes
git pull                    # Get updates
git push                    # Send changes

# Getting code
git clone URL               # Download repository
git pull                    # Update local code

# History
git log --oneline           # See commit history
```

### Remember

1. **Always commit with meaningful messages** - Your future self will thank you
2. **Pull before push** - Avoid conflicts with others
3. **Commit often** - Small, frequent commits are better than large ones
4. **Don't be afraid to experiment** - Git keeps everything safe
5. **Practice makes perfect** - The more you use Git, the more natural it becomes

---

## Congratulations!

You now know the fundamentals of Git and GitHub! These skills will serve you throughout your programming journey. Start with simple projects and gradually work your way up to more complex collaborations.

**Next steps:**
- Practice with your own small projects
- Try contributing to open-source projects
- Learn about branches and merging
- Explore GitHub's additional features

Happy coding! 🚀
