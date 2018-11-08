#!/bin/bash

#GET THE ENV
source ./env.sh

apt-get install -y software-properties-common
add-apt-repository -y ppa:certbot/certbot
wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get update -y
apt-get install -y nodejs curl tmux unzip
ufw allow 22
ufw allow 80
ufw allow 443
ufw allow 3333
ufw allow 4444
ufw default allow outgoing
ufw default deny incoming
ufw enable
#LETSENCRYPT
apt-get install -y nginx ufw certbot

openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
mkdir -p /var/lib/letsencrypt/.well-known
chgrp www-data /var/lib/letsencrypt
chmod g+s /var/lib/letsencrypt
cp ./speechconf/letsencrypt.conf /etc/nginx/snippets/letsencrypt.conf
cp ./speechconf/ssl.conf /etc/nginx/snippets/ssl.conf
#copy letsencrypt to /var/lib
certbot certonly --agree-tos --email $SPEECH_ADMIN_EMAIL --webroot -w /var/lib/letsencrypt/ -d $SPEECH_DOMAIN_NAME -d $SPEECH_WWW_DOMAIN_NAME

#SET UP NGINX
sed -i "s/{{DOMAIN_NAME}}/$SPEECH_DOMAIN_NAME/g; s/{{WWW_DOMAIN_NAME}}/$SPEECH_WWW_DOMAIN_NAME/g; s/{{ADMIN_EMAIL}}/$SPEECH_ADMIN_EMAIL/g;" ./speechconf/myspeech
cp ./speechconf/myspeech /etc/nginx/sites-available/
systemctl reload nginx

#DO THE MYSQL
./mysql.sh
