#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

# sudo apt-get install mongodb-org=3.2.18 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20 --allow-unauthenticated

sudo rm /etc/mongod.conf
sudo cp /home/ubuntu/environment/mongod.service /etc/mongod.service
sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf

sudo systemctl start mongod
sudo systemctl enable mongod
