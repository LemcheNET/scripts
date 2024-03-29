#!/bin/sh

username=john.doe@example.com
password=passw0rd
server=rhn.linux.example.com

echo
echo "*******************************************************************************"
echo "* Downloading, and running bootstrap script from IBM RedHat Satelite server   *"
echo "*******************************************************************************"
echo
wget -qO- --no-check-certificate https://${server}/pub/bootstrap/bootstrap.sh | /bin/bash

echo
echo "*******************************************************************************"
echo "* Registering RHEL to IBM RedHat Satelite server                              *"
echo "*******************************************************************************"
echo
rhnreg_ks --force --username=$username --password=$password

echo
echo "*******************************************************************************"
echo "* Clean old repository data                                                   *"
echo "*******************************************************************************"
echo
yum clean all

echo
echo
echo
read -p "Update RHEL? [y]: " UPDATE
if [ ! "$UPDATE" = "n" ]; then
    yum -y update
fi
