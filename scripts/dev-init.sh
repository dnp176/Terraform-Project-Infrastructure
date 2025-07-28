#!/bin/bash

# Update package list
sudo apt-get update -y

# Install Apache web server
sudo apt-get install -y apache2

# Write a simple message to the web root
echo "<h1>Hello from Dev Environment</h1>" > /var/www/html/index.html

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Get the instance's public IP
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

# Display the IP
echo "Your instance's public IP is: $PUBLIC_IP"
