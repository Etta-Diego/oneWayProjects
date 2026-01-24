#!/bin/bash

# Install required utilities
sudo apt install wget unzip zip -y

# Download website template from Tooplate
wget https://www.tooplate.com/zip-templates/2098_health.zip

# Unzip the template
unzip 2098_health.zip

# Deploy website files to Apache web root
sudo cp -r 2098_health/* /var/www/html/

# Set correct ownership and permissions
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo systemctl restart apache2
