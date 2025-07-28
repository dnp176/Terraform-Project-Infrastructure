#!/bin/bash

# Update package list
sudo apt-get update -y

# Install Nginx web server
sudo apt-get install -y nginx

# Write a simple message to the web root
echo "<h1>Hello from QA Environment (Nginx)</h1>" | sudo tee /var/www/html/index.nginx-debian.html

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Get the instance's public IP
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

# Display the IP
echo "Your instance's public IP is: $PUBLIC_IP"
