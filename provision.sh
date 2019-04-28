#!/bin/bash
sudo yum -y update
echo "yum update is completed"

#install developer tools
sudo yum install -y httpd-devel pcre perl pcre-devel zlib zlib-devel GeoIP GeoIP-devel git
sudo yum groupinstall -y "Development Tools"

#install nginx version: 1.14.1
sudo mkdir nginx
sudo cd nginx/
sudo wget http://nginx.org/download/nginx-1.14.1.tar.gz
sudo tar -xzvf nginx-1.14.1.tar.gz

#install 3rd party module to compile with nginx
git clone https://github.com/wdaike/ngx_upstream_jdomain.git
cd nginx-1.14.1

sudo ./configure --with-compat --add-module=../ngx_upstream_jdomain

#compile nginx with 3rd party module
sudo make
sudo make install

#check if nginx is installed
echo $(/usr/local/nginx/sbin/nginx -v)
