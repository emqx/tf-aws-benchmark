#!/usr/bin/env bash


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

# install emqx
sudo unzip /tmp/emqx.zip -d /opt
sudo rm /tmp/emqx.zip

# create emqx license file
sudo cat > /opt/emqx/etc/emqx.lic<<EOF
-----BEGIN CERTIFICATE-----
MIIEUDCCAzigAwIBAgIDD0JZMA0GCSqGSIb3DQEBBQUAMIGDMQswCQYDVQQGEwJD
TjERMA8GA1UECAwIWmhlamlhbmcxETAPBgNVBAcMCEhhbmd6aG91MQwwCgYDVQQK
DANFTVExDDAKBgNVBAsMA0VNUTESMBAGA1UEAwwJKi5lbXF4LmlvMR4wHAYJKoZI
hvcNAQkBFg96aGFuZ3doQGVtcXguaW8wHhcNMjAwODI2MDIwNzU5WhcNMzAwODI0
MDIwNzU5WjB9MQswCQYDVQQGEwJDTjEnMCUGA1UECgwe5p2t5bee5pig5LqR56eR
5oqA5pyJ6ZmQ5YWs5Y+4MScwJQYDVQQDDB7mna3lt57mmKDkupHnp5HmioDmnInp
mZDlhazlj7gxHDAaBgkqhkiG9w0BCQEWDWNsb3VkQGVtcXguaW8wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBdthJsl7EHAhiANddLULyNvGkkqZO2Un4
MzwrL64LLc6OwjIg0UOUgGESbzXAqX2/77vY4AskdB2M/+e/C51geEaabjtmovs+
uGQ7O3bFWhzG03MiAykG7zs/YxM+7PNBBl7Q9yvDGHp85zrPWisPR0t689q9LegK
fOEjkao10nNRl2bZOeuq50eFNO2IePdDRRq5bA+6dtDea3Rhy/0a9hC2Yr27Lq0f
6PDxDK6nvkW4g+zyG9gxMu6gA7XEBysKTFuZdIXKIDkvaVqxy11O+o15x07u7kXd
sw9ffyAAmTNPF98IAPC5RHxe5sL7M7/+nuhpDES93kMspFgzvguXAgMBAAGjgdEw
gc4wEQYJKwYBBAGDmh0BBAQMAjI1MIGUBgkrBgEEAYOaHQIEgYYMgYNlbXF4X2Jh
Y2tlbmRfcmVkaXMsZW1xeF9iYWNrZW5kX215c3FsLGVtcXhfYmFja2VuZF9wZ3Nx
bCxlbXF4X2JhY2tlbmRfbW9uZ28sZW1xeF9iYWNrZW5kX2Nhc3NhLGVtcXhfYnJp
ZGdlX2thZmthLGVtcXhfYnJpZGdlX3JhYmJpdDAQBgkrBgEEAYOaHQMEAwwBMTAQ
BgkrBgEEAYOaHQQEAwwBMjANBgkqhkiG9w0BAQUFAAOCAQEAjDIXKSO1Ykj4YLFQ
lNK7yq1j9oPAYgpn5OqdSDkAcdE2dofnMcLwjPrvABkkZ/FPvLutw/zBo95XsG6S
Qk3nCnimrNJ2iHKMhz2n92mPjGJ0u+UjT4Dsws9cZ5E1965do2ELx4zWJ08L8AuH
LdrCx1eBZAXpnbidPsAKeRLgwE9Ko4shQNmkJUwTO7C96AD473C8TfCEfOAeAypu
17z/JXeX0W2B+xgbGMFu3Jgd3kNc6d/gNvkUxBnrOx4AvqBJUSrelezw9WfQCe7E
T8YLDmqvyjEXUmLIovOGzFDhe3QJjDRNAiRjBTm6+zlF66TxbgvO6SlvndujaOkf
vmiVGQ==
-----END CERTIFICATE-----
EOF
sudo chown ubuntu:ubuntu /opt/emqx/etc/emqx.lic

# start emqx
sudo /opt/emqx/bin/emqx start