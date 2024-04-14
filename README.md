# containerf

## Description 
The project is a simple containerization tool to make a conatiner and isolate its network, mnt and PID namespaces. Also it lets you exec into the container and execute your commands. 

The container has its own isolated filesystem and isolated resources such as cpu and memory. 

## Dependancies 
1. host VM is ubuntu 22.04
2. Cgroup V2 is activated
3. host vm has docker installed 

## Usage 
To start the conatier: 
1. clone the repo with `git clone https://github.com/FK12344321/containerf.git`
2. move to the cloned repo with `cd` command
3. start the `start.sh` script with `sudo bash start.sh`
4. now you shoulld be inside the container

## Config
There is a `.env` file that contain memory and cpu limits for the container. You can modify them.

## How it works
The project does not depend upon docker but it uses this tool to extarct ubuntu filesystem, so the script `extract-fs.sh` builds a docker container based on the `Dockerfile` in the repo and extracts its filesystem. 

After that it setups the filesystem using a loop devivce and mounts a directory to it. After that an ubuntu filesystem is copied to that directory. The size of the filesystem is 10G.  

After that a cgroup is created and the cpu and memory limits are set based on the configs from the .env file. 

Finally, the script unshares the process from the net, mnt, and pid namespaces and changes the root directory to the fs created priviously. It also executes all these processes inside the cgroup created earlier 

 
