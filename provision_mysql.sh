#!/bin/bash

apt-get update
apt-get install -y mariadb-server

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb
systemctl enable mariadb

mysql -e "CREATE DATABASE IF NOT EXISTS lamp_db CHARSET utf8mb4;"
mysql lamp_db < /tmp/app/db/database.sql

mysql -e "CREATE USER IF NOT EXISTS 'admin_web'@'192.168.56.10' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON lamp_db.* TO 'admin_web'@'192.168.56.10';"
mysql -e "FLUSH PRIVILEGES;"

ip route del default