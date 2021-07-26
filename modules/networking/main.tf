module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.namespace}-vpc"
  cidr = var.cidr
  azs                              = ["${var.region}a"]
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  enable_dns_support   = true
  enable_dns_hostnames = true
}


module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.namespace}-sg"
  description = "security group for emqx"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
}