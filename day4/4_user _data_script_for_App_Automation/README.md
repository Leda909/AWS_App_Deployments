# User Data Script for App Automation

### Stage 1: Basic App Startup (No Seeding Yet)

1. Start the *se-adel-mongod-image* EC2 instance to get The MongoDB IP ADDRESS

2. Create the script to *app-user-data.sh* and place it in the Configure | Advanced detail section in the App EC2
This script installs PM2 and starts the application automatically.



### Stage 2: Full App Automation

To make the /posts page work "out of the box," we need to add the database seeding step after the DB_HOST is set, but before the app is started. This ensures the database is populated before the app tries to read from it.

1. Start the *se-adel-mongod-image* EC2 instance to get The MongoDB IP ADDRESS

2. Create the *app-user-data-full.sh* script

3. Launch Instance with User Data:

* Go to the AWS EC2 console --> Launch instances
* Select your Application AMI (se-adel-node-app-image)
* Configure the instance details (VPC, Security Group, Key Pair). 
  In the Configure | Advanced details section find the User data field
  Copy and paste the entire contents of your *app-user-data-full.sh* script into this text box



* Click Launch instance

4. Verification

Open your web browser and navigate to: http://<NEW_APP_PUBLIC_IP>/posts