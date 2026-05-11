#!/bin/bash

# ==========================================

# Linux Network Health Check Script

# Author: Vatsalya Patel

# Description:

# Checks internet connectivity,

# DNS resolution, gateway reachability,

# and network interface status.

# ==========================================

echo "=========================================="
echo " Network Health Check Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Check internet connectivity

echo "Internet Connectivity Check"
echo "------------------------------------------"

if ping -c 2 google.com > /dev/null 2>&1; then
echo "Internet Status : CONNECTED"
else
echo "Internet Status : NOT CONNECTED"
fi

echo ""

# Check DNS resolution

echo "DNS Resolution Check"
echo "------------------------------------------"

if nslookup google.com > /dev/null 2>&1; then
echo "DNS Status      : WORKING"
else
echo "DNS Status      : FAILED"
fi

echo ""

# Display default gateway

echo "Default Gateway"
echo "------------------------------------------"

gateway=$(ip route | grep default | awk '{print $3}')

if [ -n "$gateway" ]; then
echo "Gateway IP      : $gateway"
else
echo "Gateway Status  : NOT FOUND"
fi

echo ""

# Check network interfaces

echo "Network Interfaces"
echo "------------------------------------------"

ip -brief address

echo ""

# Ping gateway

echo "Gateway Reachability Check"
echo "------------------------------------------"

if ping -c 2 "$gateway" > /dev/null 2>&1; then
echo "Gateway Status  : REACHABLE"
else
echo "Gateway Status  : UNREACHABLE"
fi

echo ""
echo "Network health check completed."
