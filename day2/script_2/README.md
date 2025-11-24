# Write a bash script to deploy the Sparta App. Bare in mind you will need to:
- Use Git and GitHub to get the app code (git clone)
- Bonus: Can you get the app to run in the background rather than the foreground.
- Try to use pm2 for the above!

1. create the shh script

2. create a file in bash shell and place the scrip in it.
    ```sudo nano deploy-node-app.sh```

3. deploy the script 

    ```cat deploy-node-app.sh```

    ```./deploy-node-app.sh``` 

    if denied permission, try:
    ```sudo chmod +x deploy-node-app.sh```

    then run again the deploy command line:
    ```./deploy-node-app.sh```

    for checking status:
    <!-- ```sudo systemctl status nginx``` -->

    <!-- grap your public IP address and see the welcome page -->
    http://<Piblic address of your EC2 instance>