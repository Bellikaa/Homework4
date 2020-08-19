#!/usr/bin/env bash
showmount --all 192.168.50.10
mount -t nfs 192.168.50.10:/mnt/nfs_share /mnt -o rw,noatime,noauto,x-systemd.automount,nosuid,noexec,proto=udp,vers=3 -v
echo "192.168.50.10:/mnt/nfs_share /mnt nfs rw,noatime,noauto,x-systemd.automount,nosuid,noexec,proto=udp,vers=3 0 0" >> /etc/fstab
