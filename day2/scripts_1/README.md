0. connect to your EC2 instance in your shell (bash)
```ssh -i "se-adel-basic-key-pair.pem" ubuntu@ec2-54-216-84-202.eu-west-1.compute.amazonaws.com```

1. create the shh script

2. create a file in bash shell and place the scrip in it.
    ```sudo nano deploy-nginx.sh```

3. deploy the script 

    ```cat deploy-nginx.sh```

    ```./deploy-nginx.sh``` 

    if denied permission, try:
    ```sudo chmod +x deploy-nginx.sh```

    then run again the deploy command line:
    ```./deploy-nginx.sh```

    for checking status:
    ```sudo systemctl status nginx```

    <!-- grap your public IP address and see the welcome page -->
    http://<Piblic address of your EC2 instance>

Link to install nginx:
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04

