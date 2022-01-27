output "redis_private_ips" {
  description = "private ip of redis"
  value       = module.redis_ec2.private_ip
}

output "redis_public_ips" {
  description = "public ip of ec2 for each project"
  value       = module.redis_ec2.public_ip
}