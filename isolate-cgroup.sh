#!/bin/bash

source .env
# sudo apt update &> /dev/null
# sudo apt install cgroup-tools &> /dev/null
sudo cgcreate -g cpu,memory:cgroup
sudo cgset -r cpu.max=$CPU_LIMIT cgroup
sudo cgset -r memory.high=$MEMORY_LIMIT cgroup


