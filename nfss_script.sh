#!/usr/bin/env bash
yum install nfs-utils -y
mkdir /mnt/nfs_share
mkdir /mnt/nfs_share/upload
chmod -R 777 /mnt
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --zone=public --add-port=2049/udp --permanent
firewall-cmd --zone=public --add-port=20048/udp --permanent
firewall-cmd --reload
systemctl enable rpcbind nfs-server
systemctl start rpcbind nfs-server
echo "/mnt/nfs_share 192.168.50.11(rw,sync,root_squash,no_all_squash)" >> /etc/exports
exportfs -r
