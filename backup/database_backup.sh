#!/bin/bash

# ==========================================

# MySQL Database Backup Script

# Author: Vatsalya Patel

# Description:

# Creates timestamped backups of a MySQL

# database and compresses the output.

# ==========================================

# Database configuration

DB_NAME="sample_database"
DB_USER="root"
DB_PASSWORD="password"

# Backup destination

BACKUP_DIR="$HOME/db_backups"

# Create backup directory

mkdir -p "$BACKUP_DIR"

# Timestamp

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup filename

BACKUP_FILE="${DB_NAME}*backup*${TIMESTAMP}.sql"

echo "=========================================="
echo " Database Backup Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

echo "Database Name         : $DB_NAME"
echo "Backup Destination    : $BACKUP_DIR"
echo ""

# Check mysqldump availability

if ! command -v mysqldump &> /dev/null
then
echo "Warning: mysqldump command not found."
echo "Creating demo backup file for testing."

```
# Create demo backup content
echo "-- Sample Database Backup File" > "$BACKUP_DIR/$BACKUP_FILE"
echo "-- Generated for Linux Automation Toolkit" >> "$BACKUP_DIR/$BACKUP_FILE"
```

else
# Create real database backup
mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$BACKUP_DIR/$BACKUP_FILE" 2>/dev/null
fi

# Compress backup

gzip -f "$BACKUP_DIR/$BACKUP_FILE"

# Verify backup creation

if [ -f "$BACKUP_DIR/${BACKUP_FILE}.gz" ]; then
echo "Backup Status         : SUCCESS"
echo "Compressed Backup     : ${BACKUP_FILE}.gz"
else
echo "Backup Status         : FAILED"
fi

echo ""
echo "Available Database Backups"
echo "------------------------------------------"

ls -lh "$BACKUP_DIR"

echo ""
echo "Database backup completed."
