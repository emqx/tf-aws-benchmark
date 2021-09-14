# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#######################################
## mongodb modules
#######################################

module "mongo_networking" {
  source = "../../modules/networking"

  namespace          = var.mongo_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.mongo_instance_count)
}

module "mongo_security_group" {
  source = "../../modules/security_group"

  namespace                = var.mongo_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.mongo_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "mongo" {
  source                      = "../../modules/mongodb"
  namespace                   = var.mongo_namespace
  associate_public_ip_address = var.associate_public_ip_address
  subnet_ids                  = module.mongo_networking.subnet_ids
  sg_ids                      = [module.mongo_security_group.sg_id]
  private_key                 = var.private_key
  key_name                    = var.key_name
  instance_type               = var.mongo_instance_type
}

