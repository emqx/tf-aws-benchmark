output "influxdb_private_ips" {
  description = "private ip of influxdb"
  value       = module.influxdb.private_ip
}