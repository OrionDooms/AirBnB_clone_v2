#!/usr/bin/env bash
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

sudo service nginx restart
