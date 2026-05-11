#!/bin/bash

# ==========================================

# Linux Temporary File Cleanup Script

# Author: Vatsalya Patel

# Description:

# Cleans temporary files and displays

# disk usage before and after cleanup.

# ==========================================

# Temporary directory

TEMP_DIR="/tmp"

echo "=========================================="
echo " Temporary File Cleanup Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Temporary Directory : $TEMP_DIR"
echo ""

# Disk usage before cleanup

echo "Disk Usage Before Cleanup"
echo "------------------------------------------"

du -sh "$TEMP_DIR"

echo ""

# Cleanup process

echo "Cleaning temporary files..."
echo "------------------------------------------"

find "$TEMP_DIR" -type f -mtime +2 -exec rm -f {} ; 2>/dev/null

echo "Temporary files cleanup completed."

echo ""

# Disk usage after cleanup

echo "Disk Usage After Cleanup"
echo "------------------------------------------"

du -sh "$TEMP_DIR"

echo ""
echo "Temporary cleanup completed."

