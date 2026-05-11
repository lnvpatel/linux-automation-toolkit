#!/bin/bash

# ==========================================

# Linux User Creation Script

# Author: Vatsalya Patel

# Description:

# Automates Linux user creation and

# validates account existence.

# ==========================================

echo "=========================================="
echo " Linux User Creation Report"
echo "=========================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo ""

# Input username

read -p "Enter new username: " USERNAME

echo ""

# Check if user already exists

if id "$USERNAME" &>/dev/null; then
echo "Status : User already exists."
exit 1
fi

# Create user

sudo useradd -m "$USERNAME" 2>/dev/null

# Verify user creation

if id "$USERNAME" &>/dev/null; then
echo "Status : User created successfully."
echo "Username : $USERNAME"


echo ""
echo "Home Directory"
echo "------------------------------------------"

eval echo "~$USERNAME"


else
echo "Status : User creation failed."
fi

echo ""
echo "User creation operation completed."

