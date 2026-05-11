#!/bin/bash

# ==========================================

# Linux Backup Automation Script

# Author: Vatsalya Patel

# Description:

# Creates compressed backups of a target

# directory with timestamped archive files.

# ==========================================

# Source directory

SOURCE_DIR="$HOME"

# Backup destination

BACKUP_DIR="$HOME/backups"

# Create backup directory

mkdir -p "$BACKUP_DIR"

# Timestamp

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup filename

BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

echo "=========================================="
echo " Linux Backup Automation Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Source Directory      : $SOURCE_DIR"
echo "Backup Destination    : $BACKUP_DIR"
echo "Backup File           : $BACKUP_FILE"
echo ""

# Create compressed archive

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR" --warning=no-file-changed 2>/dev/null

# Verify backup creation

if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
echo "Backup Status         : SUCCESS"
else
echo "Backup Status         : FAILED"
fi

echo ""
echo "Backup Size"
echo "------------------------------------------"

du -sh "$BACKUP_DIR/$BACKUP_FILE"

echo ""
echo "Available Backups"
echo "------------------------------------------"

ls -lh "$BACKUP_DIR"

echo ""
echo "Backup automation completed."
