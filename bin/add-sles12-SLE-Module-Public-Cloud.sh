#!/bin/sh

# Set ftp credentials here:
username=jdoe
password=passw0rd
server=ftp.example.com

# Determing bit'ness
if [ "$(uname -m)" = "x86_64" ]; then ARCH=x86_64; else ARCH=i586; fi

echo
echo "*******************************************************************************"
echo "* Adding SLES12 SLE-Module-Public-Cloud repositories                                             *"
echo "*******************************************************************************"
echo
zypper addrepo -K --no-keep-packages ftp://$username:$password@${server}/suse/scc/Products/SLE-Module-Public-Cloud/12/${ARCH}/product SLE-Module-Public-Cloud-product-12
zypper addrepo -K --no-keep-packages ftp://$username:$password@${server}/suse/scc/Updates/SLE-Module-Public-Cloud/12/${ARCH}/update SLE-Module-Public-Cloud-update-12

echo
echo "*******************************************************************************"
echo "* Enabling all repositories                                                   *"
echo "*******************************************************************************"
echo
zypper mr -r -a

echo
echo "*******************************************************************************"
echo "* Listing repositories                                                        *"
echo "*******************************************************************************"
echo
zypper lr -u

echo
echo "*******************************************************************************"
echo "* Refreshing repositories                                                     *"
echo "*******************************************************************************"
echo
zypper ref

echo
echo "*******************************************************************************"
echo "*******************************************************************************"
read -p "Update SLES? [y]: " UPDATE
if [ ! "$UPDATE" = "n" ]; then
    zypper update -y
fi
