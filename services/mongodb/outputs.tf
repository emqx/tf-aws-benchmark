output "mongo_private_ips" {
  description = "private ip of mongo"
  value       = module.mongo.private_ip
}

output "mongo_public_ips" {
  description = "public ip of ec2 for each project"
  value       = join(",", module.mongo.public_ip)
}