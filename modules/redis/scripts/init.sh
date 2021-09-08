#!/usr/bin/env bash

sudo apt-get update
sudo apt install -y redis-server
sudo sed -i 's/bind 127.0.0.1 ::1/bind ${local_ip} ::1/g' /etc/redis/redis.conf
sudo systemctl start redis.service