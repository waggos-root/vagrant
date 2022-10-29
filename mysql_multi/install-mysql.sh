#!/bin/bash

dnf install -y https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
dnf install -y mysql-server

cat /tmp/my.cnf > /etc/my.cnf

echo "Create path /var/log/mysql"
mkdir -p /var/log/mysql
chown mysql:mysql /var/log/mysql
