output "mongo_private_ips" {
  description = "private ip of mongo"
  value       = module.mongo.private_ip
}