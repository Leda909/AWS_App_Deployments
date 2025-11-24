#!/bin/bash

# Define the connection string placeholder for MongoDB
# Example: MONGODB_PUBLIC_IP=172.31.21.201
MONGODB_PUBLIC_IP="<YOUR_MONGODB_PUBLIC_IP>"
DB_HOST="mongodb://${MONGODB_PUBLIC_IP}:27017/posts"

# update and upgrade packages 
sudo apt update -y
sudo apt upgrade -y
# install necessary libraries
sudo apt install git curl nginx sed -y

# navigate to the application directory (assuming user 'ubuntu' and standard path)
cd /home/ubuntu/nodejs20-se-test-app-2025/app

# install PM2 globally
sudo npm install -g pm2

# Install all dependencies from package.json
npm install

# set the DB_HOST Environment Variable
# This makes the variable available to the 'pm2 start' command
export DB_HOST=${DB_HOST}

# start the application using PM2
pm2 start app.js --name sparta-node-app

# Enable the application to start automatically on every reboot
# Generates the startup script
pm2 startup
# Executes the generated startup command (MUST be run as root)
# The output is dynamic, but we can call it reliably as root:
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ubuntu --hp /home/ubuntu
# Save the current list of processes for PM2 to reload on boot
pm2 save

exit 0