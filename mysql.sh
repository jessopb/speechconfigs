#!/bin/bash
#DO THE SOURCE ENV THING
# mysql -uroot -p$SPEECH_DB_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$DBPASS'"
#
#       ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'very_strong_password';
#       DELETE FROM mysql.user WHERE User='';
#       DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#       DROP DATABASE IF EXISTS test;
#       DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
#       FLUSH PRIVILEGES;

apt-get update
FLYINGBIRD=abcd1234
DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password $FLYINGBIRD'
debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password $FLYINGBIRD'
apt-get -y install mysql-server-5.7
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$FLYINGBIRD';" | mysql -u root -p$FLYINGBIRD
echo "DELETE FROM mysql.user WHERE User=''" | mysql -u root -p$FLYINGBIRD
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql -u root -p$FLYINGBIRD
echo "DROP DATABASE IF EXISTS test;" | mysql -u root -p$FLYINGBIRD
echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" | mysql -u root -p$FLYINGBIRD
echo "FLUSH PRIVILEGES;" | mysql -u root -p$FLYINGBIRD
