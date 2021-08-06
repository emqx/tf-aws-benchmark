#!/usr/bin/env bash

LIC="/opt/emqx/etc/emqx.lic"

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
*      soft   nofile      1048576
*      hard   nofile      1048576
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

# export emqx variables
sudo cat >> ~/.bashrc<<EOF
export EMQX_NODE__PROCESS_LIMIT=2097152
export EMQX_NODE__MAX_PORTS=1048576
export EMQX_LISTENER__TCP__EXTERNAL__ACCEPTORS=64
export EMQX_LISTENER__TCP__EXTERNAL__MAX_CONNECTIONS=1024000
export EMQX_LISTENER__TCP__EXTERNAL__MAX_CONN_RATE=10000
export EMQX_LISTENER__TCP__EXTERNAL__ACTIVE_N=100
export EMQX_SYSMON__LARGE_HEAP=64MB
EOF
source ~/.bashrc

# install emqx
sudo unzip /tmp/emqx.zip -d /opt
sudo rm /tmp/emqx.zip

# create emqx license file
sudo chown ubuntu:ubuntu $LIC
sudo cat > $LIC<<EOF
${emqx_lic}
EOF

# start emqx
sudo /opt/emqx/bin/emqx start