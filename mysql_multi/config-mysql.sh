#!/bin/bash

echo "Configuring path /opt/mysql_svc1..."
mkdir -p /opt/mysql_svc1
chown --reference /var/lib/mysql /opt/mysql_svc1
chmod --reference /var/lib/mysql /opt/mysql_svc1
mysqld --initialize-insecure --user=mysql --datadir=/opt/mysql_svc1
echo "/opt/mysql_svc1 setup complete"

echo "Configuring path /opt/mysql_svc2..."
mkdir -p /opt/mysql_svc2
chown --reference /var/lib/mysql /opt/mysql_svc2
chmod --reference /var/lib/mysql /opt/mysql_svc2
mysqld --initialize-insecure --user=mysql --datadir=/opt/mysql_svc2
echo "/opt/mysql_svc2 setup complete"

echo "Configuring path /opt/mysql_svc3..."
mkdir -p /opt/mysql_svc3
chown --reference /var/lib/mysql /opt/mysql_svc3
chmod --reference /var/lib/mysql /opt/mysql_svc3
mysqld --initialize-insecure --user=mysql --datadir=/opt/mysql_svc3
echo "/opt/mysql_svc3 setup complete"

echo "Starting MySQL for service 1"
systemctl enable --now mysqld@svc1

echo "Starting MySQL for service 2"
systemctl enable --now mysqld@svc2

echo "Starting MySQL for service 3"
systemctl enable --now mysqld@svc2
