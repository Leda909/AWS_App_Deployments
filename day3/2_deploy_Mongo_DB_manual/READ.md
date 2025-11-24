### 0. Already have EC2 instance to the App and the app deployed on it and run

### 1. Create new EC2 instance for the MongoDB

### 2. Connect to MongoDB EC2 in bash, then run following steps:

Link to install mongodb, gnupg etc:

https://pm2.io/docs/runtime/overview/

https://www.mongodb.com/docs/v7.0/tutorial/install-mongodb-on-ubuntu/
https://www.mongodb.com/docs/manual/reference/default-mongodb-port/

`sudo apt update -y`

`sudo apt upgrade -y`

`sudo apt gnupg -y`
  
    * sudo apt gnupg curl -y

    * sudo apt install gnupg -y

    * curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

   * Create sources list file - configures how to install mongodb

    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

    * sudo apt update -y

    * sudo apt install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh=2.1.5 mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

    * mongod --version

Continue:

    * cd /etc

    * ls

`sudo nano mongod.conf`

Change the IP address in the mongo config file:
    network interfaces
        net:
            port: 27017
            bindIp: 0.0.0.0

    cat mongod.conf

    * sudo systemctl start mongod
    * sudo systemctl status mongod


### Swap To the other EC2 Ubuntu instance in the bash terminal

So, I am here: ubuntu@ip-172-31-21-227:~/nodejs20-se-test-app-2025/app$
Additional: `.bashrc`

1. comand:  export DB_HOST=mongodb://DBIPADDRESS:27017/posts
`export DB_HOST=mongodb://34.252.38.8:27017/posts`

2. command for checking an env var
`printenv DB_HOST`

3. then following command needed:
`pm2 kill`
`sudo npm install`
`node seeds/seed.js`
`pm2 start app.js`

