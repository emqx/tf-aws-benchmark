#!/usr/bin/env bash

HOME="/home/ubuntu"

# Install necessary dependencies
sudo apt-get -y update
sudo apt-get -y install zip

# system config
sudo sysctl -w fs.file-max=2097152
sudo sysctl -w fs.nr_open=2097152
echo 2097152 | sudo tee /proc/sys/fs/nr_open
sudo ulimit -n 1048576

echo 'fs.file-max = 1048576' | sudo tee -a /etc/sysctl.conf
echo 'DefaultLimitNOFILE=1048576' | sudo tee -a /etc/systemd/system.conf

sudo tee -a /etc/security/limits.conf << EOF
root      soft   nofile      1048576
root      hard   nofile      1048576
ubuntu    soft   nofile      1048576
ubuntu    hard   nofile      1048576
EOF

# tcp config
sudo sysctl -w net.core.somaxconn=32768
sudo sysctl -w net.ipv4.tcp_max_syn_backlog=16384
sudo sysctl -w net.core.netdev_max_backlog=16384

sudo sysctl -w net.ipv4.ip_local_port_range='1024 65535'

sudo sysctl -w net.core.rmem_default=262144
sudo sysctl -w net.core.wmem_default=262144
sudo sysctl -w net.core.rmem_max=16777216
sudo sysctl -w net.core.wmem_max=16777216
sudo sysctl -w net.core.optmem_max=16777216

sudo sysctl -w net.ipv4.tcp_rmem='1024 4096 16777216'
sudo sysctl -w net.ipv4.tcp_wmem='1024 4096 16777216'

sudo modprobe ip_conntrack
sudo sysctl -w net.nf_conntrack_max=1000000
sudo sysctl -w net.netfilter.nf_conntrack_max=1000000
sudo sysctl -w net.netfilter.nf_conntrack_tcp_timeout_time_wait=30
sudo sysctl -w net.ipv4.tcp_max_tw_buckets=1048576
sudo sysctl -w net.ipv4.tcp_fin_timeout=15


# install emqx
#unzip /tmp/emqx.zip -d $HOME
chown -R ubuntu:ubuntu $HOME/emqx

# emqx tuning
sed -i 's/name = "emqx@127.0.0.1"/name = emqx@${local_ip}/g' $HOME/emqx/etc/emqx.conf
sed -i 's/max_conn_rate = 1000/max_conn_rate = 1000000/g' $HOME/emqx/etc/emqx.conf
sed -i 's/conn_messages_in = "100,10s"/conn_messages_in = "10000000,1s"/g' $HOME/emqx/etc/emqx.conf
sed -i 's/conn_bytes_in = "100KB,10s"/conn_bytes_in = "10000000KB,1s"/g' $HOME/emqx/etc/emqx.conf
sed -i 's/overall_messages_routing = "200000,1s"/overall_messages_routing = "20000000,1s"/g' $HOME/emqx/etc/emqx.conf

# install collected
sudo wget -q --no-check-certificate https://13.251.133.132/xmeter_tools/collectd.conf.ubuntu16.sample
sudo apt install -y collectd
addr=$(ip a |grep 'inet '|grep -v 127 |awk '{print $2}'|cut -d '/' -f 1)
sudo sed -i "s/Hostname \"localhost\"/Hostname \"$addr\"/g" collectd.conf.ubuntu16.sample
sudo mv collectd.conf.ubuntu16.sample /etc/collectd/collectd.conf
sudo systemctl restart collectd