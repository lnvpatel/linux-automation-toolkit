#!/bin/bash

# ==========================================

# Linux Disk Monitoring Script

# Author: Vatsalya Patel

# Description:

# Monitors disk usage and displays

# warning alerts if usage exceeds threshold.

# ==========================================

# Warning threshold percentage

THRESHOLD=80

echo "=========================================="
echo " Disk Usage Monitoring Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Read disk usage information

df -h --output=source,pcent,target | tail -n +2 | while read filesystem usage mountpoint
do
# Remove % symbol
usage_value=$(echo "$usage" | sed 's/%//')


echo "Partition   : $filesystem"
echo "Mounted On  : $mountpoint"
echo "Usage       : $usage"

# Threshold check
if [ "$usage_value" -ge "$THRESHOLD" ]; then
    echo "Status      : WARNING - High Disk Usage!"
else
    echo "Status      : OK"
fi

echo "------------------------------------------"


done

echo "Disk monitoring completed."
