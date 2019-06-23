#!/bin/sh

sudo systemctl start \
  chrony \
  bind9 \
  mysql \
  rabbitmq-server \
  memcached \
  etcd \
  dirsrv-admin \
  dirsrv@default.service \
  pki-tomcatd \
  apache2 \
  ipvsadm \
  haproxy \
  glance-registry \
  glance-api \
  qemu-kvm \
  nova-api \
  nova-xvpvncproxy \
  nova-console \
  nova-consoleauth \
  nova-scheduler \
  nova-conductor \
  nova-novncproxy \
  nova-compute \
  neutron-server \
  neutron-l3-agent \
  neutron-linuxbridge-agent \
  neutron-dhcp-agent \
  neutron-metadata-agent \
  neutron-linuxbridge-agent \
  cinder-scheduler \
  tgt \
  cinder-volume \
  designate-worker \
  designate-producer \
  designate-central \
  designate-api \
  designate-agent \
  designate-mdns

sudo systemctl stop \
  designate-mdns \
  designate-agent \
  designate-api \
  designate-central \
  designate-producer \
  designate-worker \
  cinder-volume \
  tgt \
  cinder-scheduler \
  neutron-linuxbridge-agent \
  neutron-metadata-agent \
  neutron-dhcp-agent \
  neutron-linuxbridge-agent \
  neutron-l3-agent \
  neutron-server \
  nova-compute \
  nova-novncproxy \
  nova-conductor \
  nova-scheduler \
  nova-consoleauth \
  nova-console \
  nova-xvpvncproxy \
  nova-api \
  qemu-kvm \
  glance-api \
  glance-registry \
  haproxy \
  ipvsadm \
  apache2 \
  pki-tomcatd \
  dirsrv-admin \
  dirsrv@default.service \
  etcd \
  memcached \
  rabbitmq-server \
  mysql \
  bind9 \
  chrony
