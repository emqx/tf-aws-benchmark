locals {
  project = {
    emqx = {
      instance_count = var.emqx_instance_count,
      instance_type        = var.emqx_instance_type,
      namespace            = var.namespace
    }
  }
}

module "networking" {
  source = "./modules/networking"

  # for_each = local.project

  # namespace = "${each.value.namespace}-${each.key}"
  # cidr = var.vpc_cidr_block
  # private_subnets = slice(var.private_subnet_cidr_blocks, 0, each.value.subnets_per_vpc)
  # public_subnets = slice(var.public_subnet_cidr_blocks, 0, each.value.subnets_per_vpc)
}

module "security_group" {
  source = "./modules/security_group"

  for_each = local.project

  namespace                = "${each.value.namespace}-${each.key}"
  ingress_with_cidr_blocks = var.emqx_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
  vpc_id                   = module.networking.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  for_each = local.project

  namespace                   = "${each.value.namespace}-${each.key}"
  instance_count              = each.value.instance_count
  instance_type               = each.value.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_ids   = module.networking.subnet_ids
  sg_ids       = [module.security_group[each.key].sg_id]
  private_key  = var.private_key
  emqx_package = var.emqx_package
  key_name     = var.key_name
  emqx_lic     = var.emqx_lic
  os           = var.os
}

