#!/bin/bash

# ==========================================

# Linux User Disable Script

# Author: Vatsalya Patel

# Description:

# Locks a Linux user account and

# verifies account status.

# ==========================================

echo "=========================================="
echo " Linux User Disable Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Input username

read -p "Enter username to disable: " USERNAME

echo ""

# Verify user exists

if ! id "$USERNAME" &>/dev/null; then
echo "Status : User does not exist."
exit 1
fi

# Lock user account

sudo usermod -L "$USERNAME" 2>/dev/null

# Verify account lock

STATUS=$(sudo passwd -S "$USERNAME" 2>/dev/null | awk '{print $2}')

if [ "$STATUS" = "L" ]; then
echo "Status : User account locked successfully."
echo "Username : $USERNAME"
else
echo "Status : Failed to lock user account."
fi

echo ""
echo "User disable operation completed."
