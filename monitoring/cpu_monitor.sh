#!/bin/bash

# ==========================================

# Linux CPU Monitoring Script

# Author: Vatsalya Patel

# Description:

# Monitors CPU load, uptime, and

# top CPU-consuming processes.

# ==========================================

# Warning threshold percentage

THRESHOLD=75

echo "=========================================="
echo " CPU Usage Monitoring Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Get CPU load percentage

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_usage_int=${cpu_usage%.*}

echo "CPU Usage    : ${cpu_usage_int}%"

# Threshold check

if [ "$cpu_usage_int" -ge "$THRESHOLD" ]; then
echo "Status       : WARNING - High CPU Usage!"
else
echo "Status       : OK"
fi

echo "------------------------------------------"

# System uptime

echo ""
echo "System Uptime"
echo "------------------------------------------"
uptime -p

# Load average

echo ""
echo "Load Average"
echo "------------------------------------------"
uptime | awk -F'load average:' '{ print $2 }'

# Top CPU-consuming processes

echo ""
echo "Top 5 CPU Consuming Processes"
echo "------------------------------------------"

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

echo ""
echo "CPU monitoring completed."

