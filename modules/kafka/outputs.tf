
output "zookeeper_connect_string" {
  description = "Connection string of kafka"
  value = aws_msk_cluster.kafka.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.kafka.bootstrap_brokers_tls
}