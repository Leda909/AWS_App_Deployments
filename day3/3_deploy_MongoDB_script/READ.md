## Create EC2 instance for MongoDB

Create Security Group and Port for Mongo DB

There is a basic shh, port: 22, TPC, 0.0.0.0/0

For Mongo DB: Custom TPC, port: 27017, TPC, 0.0.0.0/0
Port range

## Connect to MongoDB EC2

## Create the script for MongoDB deployment

1. Create the Script
`sudo nano deploy-mongodb_v1.sh`

2. Place the code in the Script file from deploy-mongodb.sh file

3. Run the Script
`source deploy-mongodb_v1.sh`
or
`sudo chmod +x deploy-mongodb_v2.sh`
`./deploy-mongodb_v2.sh`

To check: `ls -l deploy-mongodb_v2.sh`

4. IMPORTANT: this version of deployment still requires manual configuration. Change the bindIp: 127.0.0.1' to 'bindIp: 0.0.0.0'

Start and enable MongoDB (will fail if config isn't changed and this is run)

Then run the followning command in bash terminal of MongoDB EC2

echo "Starting and enabling MongoDB service..."

`sudo systemctl start mongod`
`sudo systemctl enable mongod`
`sudo systemctl status mongod`