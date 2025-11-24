### conect to Mongo EC2
`ssh -i "<your-key-pair.pem>" ubuntu@ec2-<your public EC2 IP address>.eu-west-1.compute.amazonaws.com`

See image

### create the script, and place the script code in it.
<!-- `sudo nano deploy-mongodb.sh` -->
`sudo nano mongod.conf`

### deploy MongoDB via script
<!-- `bash deploy-mongodb.sh` -->
`bash mongod.conf`

### Swap To the other EC2 Ubuntu instance in the bash terminal, and deploy your app
Create script file
`sudo nano deploy-app.sh`
Run script
`source deploy-app.sh`

Now, based on the script: you are here: ubuntu@ip-172-31-21-227:~/nodejs20-se-test-app-2025/app$

Another way to connect App to MongoDB via .bashrc file
Check which directory I am
`pwd`

Then, go to home directory in App EC2 --> do twice to get to the root file
`cd ..` 

`ls -a`

`sudo nano .bashrc`

In the file add following command at the end:
`DB_HOST=mongodb://EC2-DB-IP-PUBLIC-ADDRESS:27017/posts`

MY EC2-DB-IP-PUBLIC-ADDRESS =  108.130.200.59
export DB_HOST=mongodb://108.130.200.59:27017/posts

Deploy the MongoDB with the right IP ADDRESS
`source .bashrc`

Command for checking an env var
`printenv DB_HOST`

Then do the following command to restart the App!
`pm2 kill`
Go into the App folder in your Application
`cd nodejs20-se-test-app-2025/app`
Redo following to double-check
`sudo npm install`
`node seeds/seed.js`
`pm2 start app.js`
