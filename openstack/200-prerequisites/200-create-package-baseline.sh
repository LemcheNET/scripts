#!/bin/sh

##############################################################################
# Get package listing
##############################################################################
dpkg -l | grep ^ii | awk '{print $2}' > os_installed_packages.txt
