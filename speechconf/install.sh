#!/bin/bash

#DO THE SOURCE ENV THING
      source = ./env.sh
      apt-get install -y software-properties-common
      add-apt-repository -y ppa:certbot/certbot

      wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
      apt-get update -y
      apt-get install -y nodejs curl tmux unzip nginx ufw certbot
      ufw allow 'OpenSSH'
      ufw allow 'Nginx Full'
      ufw allow 3333
      ufw allow 4444
      ufw default allow outgoing
      ufw default deny incoming
      ufw enable
      openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
      mkdir -p /var/lib/letsencrypt/.well-known
      chgrp www-data /var/lib/letsencrypt
      chmod g+s /var/lib/letsencrypt
      #now wget letsencrypt

      #copy letsencrypt to /var/lib
      certbot certonly --agree-tos --email $ADMIN_EMAIL --webroot -w /var/lib/l$
