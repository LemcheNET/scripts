#!/bin/bash

##############################################################################
# Register Nova on Controller host
##############################################################################
openstack user create \
  --domain default \
  --password $NOVA_PASS \
  nova
openstack role add \
  --project service \
  --user nova \
  admin
openstack service create \
  --name nova \
  --description "OpenStack Compute" \
  compute
openstack endpoint create \
  --region RegionOne \
  compute public http://${CONTROLLER_FQDN}:8774/v2.1
openstack endpoint create \
  --region RegionOne \
  compute internal http://${CONTROLLER_FQDN}:8774/v2.1
openstack endpoint create \
  --region RegionOne \
  compute admin http://${CONTROLLER_FQDN}:8774/v2.1

openstack user create \
  --domain default \
  --password $PLACEMENT_PASS \
  placement
openstack role add \
  --project service \
  --user placement \
  admin
openstack service create \
  --name placement \
  --description "Placement API" \
  placement
openstack endpoint create \
  --region RegionOne \
  placement public http://${CONTROLLER_FQDN}:8778
openstack endpoint create \
  --region RegionOne \
  placement internal http://${CONTROLLER_FQDN}:8778
openstack endpoint create \
  --region RegionOne \
  placement admin http://${CONTROLLER_FQDN}:8778
