#!/bin/bash 

sudo cp ubuntu.tar.gz /
loop_device=$(losetup -j /containerf/file | awk -F: '{print $1}')
sudo umount $loop_device &> /dev/null
sudo losetup -D $loop_device &> /dev/null

sudo fallocate -l 10G /containerf/file
loop_device=$(sudo losetup -fP --show /containerf/file)
sudo mkfs.ext4 $loop_device &> /dev/null
sudo mkdir -p /containerf/fs
sudo mount -t ext4 $loop_device /containerf/fs
sudo tar --no-same-owner --no-same-permissions --owner=0 --group=0 -mxf  /ubuntu.tar.gz -C /containerf/fs/
sudo rm /ubuntu.tar.gz
