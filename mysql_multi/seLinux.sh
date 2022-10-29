#!/bin/bash

echo "Installing checkpolicy"
dnf install -y checkpolicy

echo "Copying mysql_policy.te to /home/vagrant/selinux/"
mkdir -p /home/vagrant/selinux/
cp /tmp/mysql_selinux.te /home/vagrant/selinux/mysql_policy.te

echo "Compiling and installing SeLinux policy..."
cd /home/vagrant/selinux
checkmodule -M -m -o mysql_policy.mod mysql_policy.te
semodule_package -o mysql_policy.pp -m mysql_policy.mod
semodule -i mysql_policy.pp

echo "Allow mysql to use custom service ports"
setsebool -P nis_enabled=true
echo "SeLinux done."
