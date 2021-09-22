output "influxdb_private_ips" {
  description = "private ip of webhook"
  value       = module.influxdb.private_ip
}