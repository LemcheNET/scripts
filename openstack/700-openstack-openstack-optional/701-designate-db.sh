#!/bin/bash

##############################################################################
# Create Designate DB on Controller host
##############################################################################
cat << EOF | sudo tee /var/lib/openstack/designate.sql
CREATE DATABASE designate CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON designate.* TO 'designate'@'localhost' IDENTIFIED BY '${DESIGNATE_DBPASS}';
GRANT ALL PRIVILEGES ON designate.* TO 'designate'@'%' IDENTIFIED BY '${DESIGNATE_DBPASS}';
EOF
sudo chmod 0600 /var/lib/openstack/designate.sql
sudo cat /var/lib/openstack/designate.sql | sudo mysql --host=localhost --user=root
mysqldump --host=${CONTROLLER_FQDN} --port=3306 --user=designate --password=$DESIGNATE_DBPASS designate
