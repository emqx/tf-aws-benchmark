# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#######################################
## influxdb modules
#######################################

module "influxdb_networking" {
  source = "../../modules/networking"

  namespace          = var.influxdb_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.influxdb_instance_count)
}

module "influxdb_security_group" {
  source = "../../modules/security_group"

  namespace                = var.influxdb_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.influxdb_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "influxdb" {
  source                      = "../../modules/influxdb"
  namespace                   = var.influxdb_namespace
  associate_public_ip_address = var.associate_public_ip_address
  subnet_ids                  = module.influxdb_networking.subnet_ids
  sg_ids                      = [module.influxdb_security_group.sg_id]
  private_key                 = var.private_key
  key_name                    = var.key_name
  instance_type               = var.influxdb_instance_type
}

