#!/bin/bash

# ==========================================

# Linux Memory Monitoring Script

# Author: Vatsalya Patel

# Description:

# Monitors system memory usage and

# displays warning alerts if memory

# usage exceeds threshold.

# ==========================================

# Warning threshold percentage

THRESHOLD=75

echo "=========================================="
echo " Memory Usage Monitoring Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Get memory information

total_memory=$(free -m | awk '/Mem:/ {print $2}')
used_memory=$(free -m | awk '/Mem:/ {print $3}')
free_memory=$(free -m | awk '/Mem:/ {print $4}')

# Calculate memory usage percentage

usage_percent=$((used_memory * 100 / total_memory))

echo "Total Memory : ${total_memory} MB"
echo "Used Memory  : ${used_memory} MB"
echo "Free Memory  : ${free_memory} MB"
echo "Usage        : ${usage_percent}%"

# Threshold check

if [ "$usage_percent" -ge "$THRESHOLD" ]; then
echo "Status       : WARNING - High Memory Usage!"
else
echo "Status       : OK"
fi

echo "------------------------------------------"

# Show top memory-consuming processes

echo ""
echo "Top 5 Memory Consuming Processes"
echo "------------------------------------------"

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

echo ""
echo "Memory monitoring completed."
