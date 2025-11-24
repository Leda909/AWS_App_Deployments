#!/bin/bash

# --- CONFIGURATION ---
# REPLACE <YOUR_MONGODB_PUBLIC_IP> with the actual private IP of your MongoDB EC2 instance
MONGODB_PUBLIC_IP="<YOUR_MONGODB_PUBLIC_IP>"
DB_HOST="mongodb://${MONGODB_PUBLIC_IP}:27017/posts"
APP_DIR="/home/ubuntu/nodejs20-se-test-app-2025/app"

# update and upgrade packages 
sudo apt update -y
sudo apt upgrade -y

# install git
sudo apt install git -y

# get the app code
git clone https://github.com/Leda909/nodejs20-se-test-app-2025.git

# install necessary libraries
sudo apt install curl nginx sed -y

# use sed to change nginx config
sudo sed -i "51c\proxy_pass http://127.0.0.1:3000;" /etc/nginx/sites-available/default

# restart nginx to apply changes
sudo systemctl restart nginx

# enable --> makes the process a startup process
sudo systemctl enable nginx

# dowload nodejs 20
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"

# install nodejs
sudo apt install nodejs -y

# navigate to the Application Directory
cd ${APP_DIR}

# install PM2 Globally
sudo npm install -g pm2

# Install all dependencies from package.json
npm install

# set the DB_HOST Environment Variable for this session
export DB_HOST=${DB_HOST}

# CRITICAL: Seed the Database
# We use the 'node seeds/seed.js' command, which relies on the exported DB_HOST
echo "Starting Database Seeding..."
node seeds/seed.js

# Start the Application using PM2
echo "Starting Application with PM2..."
pm2 start app.js 

# Enable Persistence (Automatic Startup on Boot)
echo "Enabling PM2 Startup on Boot..."
# This command ensures PM2 is launched as a service for the 'ubuntu' user
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ubuntu --hp /home/ubuntu
# Save the current list (sparta-app) so PM2 knows what to start
pm2 save

echo "Deployment complete. Application should be running."

exit 0