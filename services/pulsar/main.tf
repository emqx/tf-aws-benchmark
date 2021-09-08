# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#######################################
## pulsar modules
#######################################

module "pulsar_networking" {
  source = "../../modules/networking"

  namespace          = var.pulsar_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.pulsar_instance_count)
}

module "pulsar_security_group" {
  source = "../../modules/security_group"

  namespace                = var.pulsar_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.pulsar_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "pulsar_ec2" {
  source = "../../modules/pulsar"

  namespace                   = var.pulsar_namespace
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.pulsar_instance_type
  subnet_ids                  = module.pulsar_networking.subnet_ids
  sg_ids                      = [module.pulsar_security_group.sg_id]
  private_key                 = var.private_key
  key_name                    = var.key_name
}
