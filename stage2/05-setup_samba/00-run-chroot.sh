#!/bin/bash -e

# Samba configuration file
smb_conf="/etc/samba/smb.conf"

# Name of the Samba share
share_name="HomeShare"

# The path of the directory to share
share_path="/home/ese_user"

# The username for Samba (assuming it's the same as the system username)
samba_user="ese_user"

# Check if the share already exists in smb.conf
if grep -q "\[$share_name\]" "$smb_conf"; then
    echo "Share '$share_name' already exists in $smb_conf."
else
    # Append the configuration for the new share at the end of smb.conf
    echo "Adding new Samba share '$share_name' to $smb_conf."
    {
        echo "[$share_name]"
        echo "path = $share_path"
        echo "valid users = $samba_user"
        echo "read only = no"
        echo "browsable = yes"
        echo "writable = yes"
    } >> "$smb_conf"

fi
