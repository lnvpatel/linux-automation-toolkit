#!/bin/bash

# ==========================================

# Linux Network Health Check Script

# Author: Vatsalya Patel

# Description:

# Performs network diagnostics including:

# - Internet connectivity

# - DNS resolution

# - Gateway detection

# - Interface status

# ==========================================

echo "=========================================="
echo " Network Health Check Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Internet connectivity check using curl

echo "Internet Connectivity Check"
echo "------------------------------------------"

if curl -Is https://www.google.com | head -n 1 | grep "200" > /dev/null; then
echo "Internet Status : CONNECTED"
else
echo "Internet Status : NOT CONNECTED"
fi

echo ""

# DNS resolution check

echo "DNS Resolution Check"
echo "------------------------------------------"

if getent hosts google.com > /dev/null; then
echo "DNS Status      : WORKING"
else
echo "DNS Status      : FAILED"
fi

echo ""

# Default gateway

echo "Default Gateway"
echo "------------------------------------------"

gateway=$(ip route | grep default | awk '{print $3}')

if [ -n "$gateway" ]; then
echo "Gateway IP      : $gateway"
else
echo "Gateway Status  : NOT FOUND"
fi

echo ""

# Network interfaces

echo "Network Interfaces"
echo "------------------------------------------"

ip -brief address

echo ""

# Connectivity test to gateway

echo "Gateway Reachability Check"
echo "------------------------------------------"

if ping -c 2 "$gateway" > /dev/null 2>&1; then
echo "Gateway Status  : REACHABLE"
else
echo "Gateway Status  : UNREACHABLE OR RESTRICTED"
fi

echo ""
echo "Network health check completed."
