#!/usr/bin/env bash
<<<<<<< HEAD
# Script that sets up web servers for the deployment of web_static
sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
=======
#This script prepare and sets up your web servers for the deployment.
#install Nginx
sudo apt-get update
sudo apt-get install nginx -y
#create folders
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

sudo chown -R ubuntu:ubuntu /data/
#create a fake HTML page testing the configuration
echo "<!DOCTYPE html>
<head>
</head>
<body>Holberton School</body>
</html>" > /data/web_static/releases/test/index.html
#create a symbolic link and if the link already exists it should be deleted
#and then recreated.
path1="/data/web_static/current"
path2="/data/web_static/releases/test/"
if [-L $path1];then
	rm $path1

In -s $path1 $path2

sudo sed -i '/a location /hbnb_static {alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
>>>>>>> e04053ca3b80d113d54adf28a4169a939431fde0

sudo service nginx restart
