#!/bin/bash

# ==========================================

# Linux Log Cleanup Script

# Author: Vatsalya Patel

# Description:

# Cleans old log files from a target

# directory while handling permissions safely.

# ==========================================

# Log directory

LOG_DIR="/var/log"

# Delete logs older than N days

DAYS=7

echo "=========================================="
echo " Linux Log Cleanup Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Target Log Directory : $LOG_DIR"
echo "Cleanup Threshold    : $DAYS days"
echo ""

# Verify log directory

if [ ! -d "$LOG_DIR" ]; then
echo "Error: Log directory not found."
exit 1
fi

echo "Log Files Before Cleanup"
echo "------------------------------------------"

find "$LOG_DIR" -type f -name "*.log" 2>/dev/null | wc -l

echo ""

echo "Searching for old log files..."
echo "------------------------------------------"

OLD_LOGS=$(find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS 2>/dev/null)

if [ -z "$OLD_LOGS" ]; then
echo "No old log files found."
else
echo "Attempting cleanup of old log files..."

```
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \; 2>/dev/null

echo "Cleanup operation completed."
```

fi

echo ""
echo "Log Files After Cleanup"
echo "------------------------------------------"

find "$LOG_DIR" -type f -name "*.log" 2>/dev/null | wc -l

echo ""
echo "Log cleanup completed."
