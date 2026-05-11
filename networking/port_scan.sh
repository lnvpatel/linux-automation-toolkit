#!/bin/bash

# ==========================================

# Linux Port Scanning Script

# Author: Vatsalya Patel

# Description:

# Displays active listening ports,

# associated services, and protocols.

# ==========================================

echo "=========================================="
echo " Active Port Scan Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Check if ss command exists

if ! command -v ss &> /dev/null
then
echo "Error: 'ss' command not found."
exit 1
fi

echo "Listening Ports and Services"
echo "------------------------------------------"

# Display active listening ports

ss -tulnp

echo ""
echo "------------------------------------------"

# Display total listening ports count

total_ports=$(ss -tuln | grep LISTEN | wc -l)

echo "Total Listening Ports : $total_ports"

echo ""
echo "Port scan completed."
