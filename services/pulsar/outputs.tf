output "pulsar_private_ips" {
  description = "private ip of pulsar"
  value       = module.pulsar_ec2.private_ip

}