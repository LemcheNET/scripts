#!/bin/bash

##############################################################################
# Create subnets for VLANs on Controller host
##############################################################################
openstack subnet create \
  --allocation-pool start=192.168.1.129,end=192.168.1.196 \
  --dns-nameserver ${DNS_ONE_IP_ADDRESS} \
  --dns-nameserver ${DNS_TWO_IP_ADDRESS} \
  --gateway 192.168.1.254 \
  --ip-version 4 \
  --network inside \
  --no-dhcp \
  --subnet-range 192.168.1.0/24 \
  inside
openstack subnet create \
  --allocation-pool start=192.168.2.2,end=192.168.2.253 \
  --dns-nameserver ${DNS_ONE_IP_ADDRESS} \
  --dns-nameserver ${DNS_TWO_IP_ADDRESS} \
  --gateway 192.168.2.254 \
  --ip-version 4 \
  --network autovoip \
  --no-dhcp \
  --subnet-range 192.168.2.0/24 \
  autovoip
openstack subnet create \
  --allocation-pool start=192.168.3.2,end=192.168.3.253 \
  --dns-nameserver ${DNS_ONE_IP_ADDRESS} \
  --dns-nameserver ${DNS_TWO_IP_ADDRESS} \
  --gateway 192.168.3.254 \
  --ip-version 4 \
  --network autovideo \
  --no-dhcp \
  --subnet-range 192.168.3.0/24 \
  autovideo
openstack subnet create \
  --allocation-pool start=172.16.0.2,end=172.16.0.253 \
  --dhcp \
  --dns-nameserver ${DNS_ONE_IP_ADDRESS} \
  --dns-nameserver ${DNS_TWO_IP_ADDRESS} \
  --gateway 172.16.0.254 \
  --ip-version 4 \
  --network servers \
  --subnet-range 172.16.0.0/24 \
  servers
openstack subnet create \
  --allocation-pool start=10.0.0.2,end=10.0.0.253 \
  --dns-nameserver ${DNS_ONE_IP_ADDRESS} \
  --dns-nameserver ${DNS_TWO_IP_ADDRESS} \
  --gateway 10.0.0.254 \
  --ip-version 4 \
  --network dmz \
  --no-dhcp \
  --subnet-range 10.0.0.0/24 \
  dmz
