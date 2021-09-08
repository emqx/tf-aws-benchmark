output "redis_private_ips" {
  description = "private ip of redis"
  value       = module.redis_ec2.private_ip
}