output "public_ip" {
  value = module.ec2.public_ip
}

output "private_ip" {
  value = module.ec2.private_ip
}

output "instance_arn" {
  value = module.ec2.instance_arn
}