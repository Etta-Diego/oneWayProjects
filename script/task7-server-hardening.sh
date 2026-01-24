#!/bin/bash

# Create new user
sudo adduser secureuser

# Grant sudo privileges
sudo usermod -aG sudo secureuser

# Disable root SSH login
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service
sudo systemctl restart ssh

