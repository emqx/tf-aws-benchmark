#!/usr/bin/env bash

# Install necessary dependencies
sudo apt-get -y update
sudo apt-get -y install openjdk-11-jre-headless

# Install webhook
wget https://github.com/emqx/emqx-svt-web-server/releases/download/web-server-1.0/svtserver-0.0.1.jar
nohup java -jar svtserver-0.0.1.jar > log.file 2>&1 &
ps aux | grep java
