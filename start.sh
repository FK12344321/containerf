#!/bin/bash 

sudo bash extract-fs.sh
sudo rm -r /containerf &> /dev/null
sudo mkdir /containerf &> /dev/null
sudo bash setup-fs.sh
sudo bash isolate-cgroup.sh

cgexec -g cpu,memory:cgroup sudo unshare --fork --pid  --mount --net --mount-proc chroot /containerf/fs 
