#!/usr/bin/env bash

# Install necessary dependencies
sudo apt-get -y update
sudo apt-get -y install openjdk-11-jre-headless

# Install influxdb
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.8.9_amd64.deb
sudo dpkg -i influxdb_1.8.9_amd64.deb
sudo service influxdb start
curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE DATABASE test"