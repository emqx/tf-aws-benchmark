module "networking" {
  source    = "./modules/networking"
  region = var.region
  namespace = var.namespace
  cidr = var.cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
}

module "ec2" {
  source     = "./modules/ec2"
  namespace  = var.namespace
  ami = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  vpc        = module.networking.vpc
  sg_ids  = [module.networking.sg_id]
}