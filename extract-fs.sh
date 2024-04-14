#!/bin/bash 

sudo docker rm ubuntu.tar.gz &> /dev/null
sudo docker build -t my-img . &> /dev/null
sudo docker create --name my-cont my-img
sudo docker export my-cont -o ubuntu.tar.gz
sudo docker rm my-cont 
sudo docker rmi my-img 
sudo chmod 777 ubuntu.tar.gz
