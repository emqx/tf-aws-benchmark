output "zookeeper_connect_string" {
  description = "Connection string of kafka"
  value = module.kafka.zookeeper_connect_string
}

output "kafka_bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = module.kafka.bootstrap_brokers_tls
}

output "zk_ip" {
  description = " a TLS connection host:port"
  value  = element(split(",", module.kafka.zookeeper_connect_string), 0)
}