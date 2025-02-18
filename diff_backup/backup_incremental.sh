#!/bin/bash

# ==========================================================
# Incremental Backup Script
# ==========================================================
# This script performs incremental backups of files from a source directory,
# saving only new or modified files since the last backup.
#
# Features:
# - Detects new or modified files since the last backup.
# - Creates .tar.gz files organized by date and time.
# - Prevents file duplication to optimize storage space.
#
# Author: Juliana Pirolla
# Version: 1.0
# Date: 02/18/25
# ==========================================================

# ==============================
# Directory Configuration
# ==============================

source_dir="/path/to/source/directory"

# where backup files will be stored
backup_dir="/path/to/backup/directory"

# ==============================
# Backup Preparation
# ==============================

current_date=$(date +"%Y-%m-%d_%H-%M-%S")
backup_name="incremental_backup_$current_date.tar.gz"
echo "[INFO] Starting incremental backup from '$source_dir' to '$backup_dir'..."

# ==============================
# Initial Checks
# ==============================

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "[ERROR] The source directory '$source_dir' does not exist."
    exit 1
fi

# Check if the backup directory exists, create it if not
if [ ! -d "$backup_dir" ]; then
    echo "[INFO] Creating backup directory '$backup_dir'..."
    mkdir -p "$backup_dir"
fi

# ==============================
# Identifying Modified Files
# ==============================

# Find the most recent backup for comparison
last_backup=$(ls -t "$backup_dir"/incremental_backup_*.tar.gz 2>/dev/null | head -n 1)

if [ -f "$last_backup" ]; then
    # Get the last backup modification date
    last_backup_date=$(stat -c %Y "$last_backup")

    echo "[INFO] Last backup found: $last_backup"
    echo "[INFO] Including only new or modified files since: $(date -d @$last_backup_date)"

    # Find new or modified files since the last backup
    new_or_modified_files=$(find "$source_dir" -type f \( -newermt "@$last_backup_date" -o -cnewer "$last_backup" \))

    # If no new or modified files are found, terminate the script
    if [ -z "$new_or_modified_files" ]; then
        echo "[INFO] No new or modified files found. Backup is not necessary."
        exit 0
    fi

    # Compress only new/modified files
    tar -czf "$backup_dir/$backup_name" -C "$source_dir" $(echo "$new_or_modified_files" | sed "s|$source_dir/||g")
else
    # If this is the first backup, create a full backup
    echo "[INFO] No previous backup found. Creating a full backup..."
    tar -czf "$backup_dir/$backup_name" -C "$source_dir" .
fi

# ==============================
# Finalization
# ==============================

echo "[SUCCESS] Incremental backup completed! Backup file created: '$backup_dir/$backup_name'"
