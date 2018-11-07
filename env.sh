#!/bin/bash
      # echo What... is your domain name?
      # read vardomainname
      # echo $vardomainname
      # export SPEECH_SET_DOMAINNAME=$vardomainname
      # echo $SPEECH_SET_DOMAINNAME

#DEBIAN UNATTEND
#ADMIN_EMAIL
#DOMAIN_NAME
echo What is your email (admin@example.com)?
read speech_admin_email
SPEECH_ADMIN_EMAIL=$speech_admin_email
echo What is your domainName (example.com)?
read speech_domain_name
SPEECH_DOMAIN_NAME=$speech_domain_name
SPEECH_WWW_DOMAIN_NAME="www.$SPEECH_DOMAIN_NAME"
echo What is your DB root password?
read flyingbird
FLYINGBIRD=flyingbird
