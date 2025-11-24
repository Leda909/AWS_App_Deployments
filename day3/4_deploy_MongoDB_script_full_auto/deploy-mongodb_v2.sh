#!/bin/bash

# --- MongoDB Installation Script V2 (Automated Config with sed) ---

# Set the IP address for binding (0.0.0.0 allows all connections)
BIND_IP="0.0.0.0"

# 1. Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update -y
sudo apt upgrade -y

# 2. Install necessary utilities (gnupg, curl)
echo "Installing gnupg and curl..."
sudo apt install -y gnupg curl

# 3. Import the MongoDB public key
echo "Importing MongoDB GPG key..."
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
--dearmor

# 4. Create the MongoDB list file for apt
echo "Creating MongoDB source list file..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# 5. Update apt package list after adding MongoDB repository
echo "Updating package list with new repository..."
sudo apt update -y

# 6. Install the specific MongoDB packages
echo "Installing MongoDB 7.0.6..."
sudo apt install -y \
  mongodb-org=7.0.6 \
  mongodb-org-database=7.0.6 \
  mongodb-org-server=7.0.6 \
  mongodb-mongosh=2.1.5 \
  mongodb-org-mongos=7.0.6 \
  mongodb-org-tools=7.0.6

# 7. Automate Configuration Change using sed
# Change 'bindIp: 127.0.0.1' to 'bindIp: 0.0.0.0' in /etc/mongod.conf
echo "Automating configuration change using sed..."
# Explanation of the sed command:
# -i: edit files in place
# 's/pattern/replacement/': substitute the first match
# pattern: bindIp: 127.0.0.1
# replacement: bindIp: 0.0.0.0
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: ${BIND_IP}/g" /etc/mongod.conf

# Verify the change (optional)
echo "Verifying /etc/mongod.conf content..."
grep 'bindIp:' /etc/mongod.conf

# 8. Start and enable MongoDB service
echo "Starting and enabling MongoDB service..."
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod