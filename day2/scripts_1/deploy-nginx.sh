# this tells to pc which shell to use
#!/bin/bash

# update packages
sudo apt update -y

# upgrade packages
sudo apt upgrade -y

# get and install nginx
sudo apt install nginx -y

# restart nginx for better configuration
sudo systemclt restart nginx

# enable nginx - make nginx startup process
sudo systemctl enable nginx

