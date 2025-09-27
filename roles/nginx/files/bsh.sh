#!/bin/bash

echo "script nginx"

#read -p "do you want install and edit nginx: " ngx

#if [[ -n "$ngx" ]]
#then
#apt install nginx && systemctl enable nginx && systemctl restart nginx
openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/cert.key -out /etc/nginxcert.pem -days 365 -subj "/C=RU/ST=KAZAKHSTAN/L=KAZ KAZAKHSTAN/O=My Organization/OU=My Unit/CN=example.com"
cd /var/www
#else
#echo "you don't want install and edit this"
#fi
