#!/bin/bash

# update and upgrade the packages
sudo apt update -y
sudo apt upgrade -y

# install necessery libaries
sudo apt install gnupg -y
sudo apt install curl -y

# add the GPG key for MongoDB --> verifies package integrity
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# create source list file for MongoDB
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# update the packages list again
sudo apt update -y

# instal Mongodb
sudo apt install -y \
  mongodb-org=7.0.6 \
  mongodb-org-database=7.0.6 \
  mongodb-org-server=7.0.6 \
  mongodb-mongosh=2.1.5 \
  mongodb-org-mongos=7.0.6 \
  mongodb-org-tools=7.0.6

# install sed
sudo apt install sed -y

# automate configuration change using sed
# -e mean expression to add extra, it is optional here
# sudo sed -i -e "s/bindIp: 127.0.0.1/bindIp:0.0.0.0/g" /etc/mongod.conf
sudo sed -i "s/bindIp: 127.0.0.1/bindIp:0.0.0.0/g" /etc/mongod.conf

# verify the change or you can use piping to less or cat
grep 'bindIp:' /etc/mongod.conf

# start and enable MongoDB service
echo "Starting and enabling MongoDB service..."
sudo systemctl start mongod

# this enables MongoDB to start on boot and helps to verify if the service is running
sudo systemctl enable mongod

# sudo systemctl restart mongod