# VPC

output "vpc" {
  description = "The VPC"
  value = module.vpc
}

output "sg_id" {
  description = "The IDs of the emqx security gourp"
  value = module.sg.security_group_id
}

