#!/bin/bash

# --- MongoDB Installation Script V1 (Manual Config) ---

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y
sudo apt upgrade -y

# Install necessary utilities (gnupg, curl)
echo "Installing gnupg and curl..."
sudo apt install -y gnupg curl

# Import the MongoDB public key
echo "Importing MongoDB GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
--dearmor

# Create the MongoDB list file for apt
echo "Creating MongoDB source list file..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update apt package list after adding MongoDB repository
echo "Updating package list with new repository..."
sudo apt update -y

# Install the specific MongoDB packages
echo "Installing MongoDB 7.0.6..."
sudo apt install -y \
  mongodb-org=7.0.6 \
  mongodb-org-database=7.0.6 \
  mongodb-org-server=7.0.6 \
  mongodb-mongosh=2.1.5 \
  mongodb-org-mongos=7.0.6 \
  mongodb-org-tools=7.0.6

# Verify the installation
mongod --version

# IMPORTANT: You must manually edit the configuration file to allow remote connections.
# Change 'bindIp: 127.0.0.1' to 'bindIp: 0.0.0.0' in /etc/mongod.conf.
echo "--- MANUAL CONFIGURATION REQUIRED ---"
echo "Please manually edit /etc/mongod.conf and change 'bindIp: 127.0.0.1' to 'bindIp: 0.0.0.0'."
echo "After saving the file, you can start MongoDB."
echo "Use: sudo nano /etc/mongod.conf"