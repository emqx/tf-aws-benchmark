output "emqx_public_ips" {
  description = "public ip of ec2 for each project"
  # value = [ for p in sort(keys(local.project)) : module.ec2[p].public_ip ]
  value = module.ec2["emqx"].public_ip
}

output "emqx_private_ips" {
  description = "private ip of ec2 for each project"
  value       = module.ec2["emqx"].private_ip
}

