#!/bin/bash

# Usage of this script to pull the addressbook project
REPO_URL="https://github.com/krishnalogs/addressbook.git"  # Replace with your repo
TARGET_DIR="/home/ubuntu/mywork/projects/addressbook"  # Directory where the repo will be cloned

# === Script ===
echo "Cloning repository from $REPO_URL into $TARGET_DIR"

# Check if the target directory already exists
if [ -d "$TARGET_DIR" ]; then
    echo "Directory '$TARGET_DIR' already exists. Aborting to avoid overwriting."
    exit 1
fi

# Clone the repository
git clone "$REPO_URL" "$TARGET_DIR"

# Check if the clone was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully into '$TARGET_DIR'."
else
    echo "Failed to clone repository."
    exit 1
fi

