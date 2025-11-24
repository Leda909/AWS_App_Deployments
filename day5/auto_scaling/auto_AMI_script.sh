#!/bin/bash

# Wait for everything to be ready - User Data runs very fast! 
sleep 15

# user data runs as root!
cd /home/ubuntu

# cd to correct folder
cd nodejs20-se-test-app-2025
cd app

# npm install
sudo npm install

# install pm2 --> process manager for node apps
sudo npm install pm2 -g

# start app
pm2 start app.js