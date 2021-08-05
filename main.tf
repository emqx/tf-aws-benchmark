locals {
  project = {
    emqx = {
      subnets_per_vpc  = var.subnets_per_vpc,
      instances_per_subnet    = var.emqx_instances_per_subnet,
      instance_type           = var.emqx_instance_type,
      namespace               = var.namespace
    }
  }
}

module "networking" {
  source    = "./modules/networking"

  for_each = local.project

  namespace = "${each.value.namespace}-${each.key}"
  cidr = var.vpc_cidr_block
  private_subnets = slice(var.private_subnet_cidr_blocks, 0, each.value.subnets_per_vpc)
  public_subnets = slice(var.public_subnet_cidr_blocks, 0, each.value.subnets_per_vpc)
}

module security_group {
  source = "./modules/security_group"

  for_each = local.project

  namespace = "${each.value.namespace}-${each.key}"
  ingress_with_cidr_blocks = var.emqx_ingress_with_cidr_blocks
  egress_with_cidr_blocks = var.egress_with_cidr_blocks
  vpc_id      = module.networking[each.key].vpc.vpc_id
}

module "ec2" {
  source     = "./modules/ec2"

  for_each = local.project

  namespace = "${each.value.namespace}-${each.key}"
  instance_count = each.value.instances_per_subnet * each.value.subnets_per_vpc
  instance_type = each.value.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  vpc = module.networking[each.key].vpc
  subnet_ids = module.networking[each.key].vpc.public_subnets
  sg_ids  = [module.security_group[each.key].sg_id]
  private_key = var.private_key
  emqx_package = var.emqx_package
  key_name = var.key_name
  emqx_lic = var.emqx_lic
  os = var.os
}