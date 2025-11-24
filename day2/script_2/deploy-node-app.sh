#!/bin/bash

# --- Configuration ---
REPO_URL="https://github.com/Leda909/nodejs20-se-test-app-2025.git"
# The directory name will be the same as the repository name after cloning
APP_DIR="nodejs20-se-test-app-2025"
# The application entry point, relative to the cloned directory root
ENTRY_FILE="app/app.js"
PM2_PROCESS_NAME="sparta-app"

echo "--- Starting Sparta App Automated Deployment (Using PM2) ---"

# --- 1. System Update and Core Dependencies ---
echo "1. Updating package lists and installing core dependencies (nginx)"
# Update and upgrade the system
sudo apt update -y
sudo apt upgrade -y
# Install core tools
sudo apt install git curl nginx -y

# --- 2. Install Node.js 20.x ---
echo "2. Installing Node.js 20.x from NodeSource PPA..."
# Install necessary dependencies for NodeSource setup
# Add the NodeSource PPA for Node.js 20.x
sudo bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -"
#  Install nodejs 20
sudo apt install nodejs -y
echo "Node.js version: $(node -v)"

# --- 3. Install PM2 Globally and Configure Startup ---
echo "3. Installing PM2 (Process Manager) globally..."
sudo npm install -g pm2
# Set PM2 to automatically restart on reboot (run as the current user)
echo "   Configuring PM2 to restart on system reboot..."
pm2 startup systemd
# Save the PM2 process list (will be used by startup script)
pm2 save

# --- 4. Application Code and Dependencies ---
echo "4. Cloning repository and installing app dependencies..."

# Check if the directory already exists
if [ -d "$APP_DIR" ]; then
    echo "  Directory $APP_DIR already exists. Pulling latest code..."
    cd $APP_DIR
    git pull
else
    echo "  Cloning repository into $APP_DIR..."
    git clone $REPO_URL $APP_DIR
    cd $APP_DIR
fi

# Navigate to the application subdirectory and install Node dependencies
# Based on your manual steps, the app folder is inside the main repo folder
cd app
echo "  Installing Node dependencies in the 'app' directory..."
sudo npm install

# Return to the root of the app directory (where the entry file is referenced from)
cd ..

# --- 5. Start Application with PM2 ---
echo "5. Starting the Sparta App with PM2 on port 3000..."

# Stop and delete any existing process with the same name to ensure a clean start
pm2 delete $PM2_PROCESS_NAME || true

# Start the application using the entry file path relative to the clone root
pm2 start $ENTRY_FILE --name $PM2_PROCESS_NAME

# Save the current list of processes for persistence across reboots
pm2 save

echo "--- Deployment Complete! ---"
echo "Application started in the background on port 3000."
echo "Check app status: pm2 status"
echo "Check app logs: pm2 logs $PM2_PROCESS_NAME"
echo "--------------------------------------------------------"