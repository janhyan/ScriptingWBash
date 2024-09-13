#!/bin/bash

# Define the path to the Samba configuration file
samba_conf="/etc/samba/smb.conf"

# Start searching for the file
echo "Searching for Samba configuration file..."

# Check if the file exists
if [ ! -f "$samba_conf" ]; then
    echo "File does not exist at $samba_conf"
    exit 1
else
    echo "File found. Creating backup and editing file..."

    # Backup the original file and replace with sed
    sed -i.bak 's/username/#username/' "$samba_conf"
    echo "File has been successfully edited"
fi