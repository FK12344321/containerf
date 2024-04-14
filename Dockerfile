FROM ubuntu:latest

RUN apt update -y && apt install -y sysbench && apt install -y iproute2


