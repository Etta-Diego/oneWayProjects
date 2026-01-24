#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Apache web server
sudo apt install apache2 -y

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2
