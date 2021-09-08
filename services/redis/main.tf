# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#######################################
## redis modules
#######################################

module "redis_networking" {
  source = "../../modules/networking"

  namespace          = var.redis_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.redis_instance_count)
}

module "redis_security_group" {
  source = "../../modules/security_group"

  namespace                = var.redis_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.redis_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "redis_ec2" {
  source = "../../modules/redis"

  namespace                   = var.redis_namespace
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.redis_instance_type
  subnet_ids                  = module.redis_networking.subnet_ids
  sg_ids                      = [module.redis_security_group.sg_id]
  private_key                 = var.private_key
  key_name                    = var.key_name
}