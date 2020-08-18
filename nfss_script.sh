#!/usr/bin/env bash
yum install nfs-utils -y
mkdir /mnt/nfs_share
mkdir /mnt/nfs_share/upload
chmod -R 777 /mnt
sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-service=nfs
sudo firewall-cmd --permanent --zone=public --add-service=mountd
sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind
sudo firewall-cmd --zone=public --add-port=2049/udp --permanent
sudo firewall-cmd --zone=public --add-port=20048/udp --permanent
sudo firewall-cmd --reload
sudo sh -c "echo '/mnt/nfs_share 192.168.50.11(rw,sync,root_squash,no_all_squash)' >> /etc/exports"
exportfs -r
