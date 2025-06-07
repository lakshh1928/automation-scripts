#!/bin/bash

# Prompt for source and destination paths
read -p "Enter the path to the file or directory you want to copy: " source_path
read -p "Enter the path where you want to make the backup: " backup_path

# Validate source exists
if [ ! -e "$source_path" ]; then
    echo "Source path does not exist. Exiting."
    exit 1
fi

# Validate backup path exists
if [ ! -d "$backup_path" ]; then
    echo "Backup path does not exist. Exiting."
    exit 1
fi

# Create Backup directory if it doesn't exist
backup_dir="$backup_path/Backup"
mkdir -p "$backup_dir" || { echo "Failed to create Backup directory."; exit 1; }

# Prompt for archive name
read -p "Enter the name for the archive (without extension): " name

# Avoid backing up into self
if [[ "$source_path" == "$backup_dir"* ]]; then
    echo "Error: Source path is inside the backup directory. This could cause recursion."
    exit 1
fi

# Create the archive
archive_path="$backup_dir/$name.tar.gz"
tar -czvf "$archive_path" -C "$(dirname "$source_path")" "$(basename "$source_path")"


