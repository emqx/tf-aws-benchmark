output "webhook_private_ips" {
  description = "private ip of webhook"
  value       = module.webhook.private_ip
}