#!/bin/bash

# update packeges
sudo apt update -y
# upgrade packages
sudo apt upgrade -y

# install git if it's not there
sudo apt install git -y

# sometimes you would need private, so it would requires autentichation token
# get the app code
git clone https://github.com/Leda909/nodejs20-se-test-app-2025.git

# install nginx
sudo apt install nginx -y

# install sed
sudo apt install sed -y

# use sed to change nginx config
sudo sed -i '51c\proxy_pass http://127.0.0.1:3000;' /etc/nginx/sites-available/default

# restart nginx to apply changes
sudo systemctl restart nginx

# enable --> makes the process a startup process
sudo systemctl enable nginx

# install curl if it's not there --> it helps to download files
sudo apt install curl -y

# dowload nodejs 20
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"

# install nodejs
sudo apt install nodejs -y

# cd into repo and app folder
cd nodejs20-se-test-app-2025/app

# install npm
sudo npm install

# install pm2 --> process manager for node apps
sudo npm install pm2 -g

# kill all node processes
pm2 kill

# start the app with pm2
pm2 start app.js # --name sparta-app