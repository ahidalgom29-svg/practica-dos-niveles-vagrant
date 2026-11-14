#!/bin/bash

apt-get update
apt-get install -y apache2 php libapache2-mod-php php-mysql

chown -R www-data:www-data /var/www/html/app
chmod -R 755 /var/www/html/app

systemctl restart apache2
systemctl enable apache2