#!/usr/bin/env bash

HOME="/home/ubuntu"

# Install necessary dependencies
sudo apt-get -y update
sudo apt-get -y install openjdk-11-jre-headless


# Install pulsar
sudo wget https://archive.apache.org/dist/pulsar/pulsar-2.6.0/apache-pulsar-2.6.0-bin.tar.gz
sudo tar -zxvf $HOME/apache-pulsar-2.6.0-bin.tar.gz
cd $HOME/apache-pulsar-2.6.0
sudo sed -i 's/advertisedAddress=/advertisedAddress=${local_ip}/g' $HOME/apache-pulsar-2.6.0/conf/standalone.conf

# Run pulsar
sudo bin/pulsar-daemon start standalone

