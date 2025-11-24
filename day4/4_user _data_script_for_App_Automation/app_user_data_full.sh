#!/bin/bash

# ----- Configuration ----------
MONGODB_PUBLIC_IP="<YOUR_MONGODB_PUBLIC_IP>"
DB_HOST="mongodb://${MONGODB_PUBLIC_IP}:27017/posts"
APP_DIR="/home/ubuntu/nodejs20-se-test-app-2025/app"

# Wait for everything to be ready
sleep 15

# cd to correct folder
cd ${APP_DIR}

# npm install
sudo npm install

# install pm2 --> process manager for node apps
sudo npm install pm2 -g

# set the DB_HOST Environment Variable
export DB_HOST=${DB_HOST}

# seed the database
echo "Starting Database Seeding..."
node seeds/seed.js

# start app
echo "Starting Application with PM2..."
pm2 start app.js