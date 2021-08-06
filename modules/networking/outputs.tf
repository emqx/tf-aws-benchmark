# VPC

output "subnet_ids" {
  description = "The VPC"
  value = data.aws_subnet_ids.emqx.ids
}

output "sg_id" {
  description = "The IDs of the emqx security gourp"
  value = module.sg.security_group_id
}

