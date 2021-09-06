# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

module "mongo_security_group" {
  source = "../../modules/security_group"

  namespace                = var.mongo_namespace
  vpc_id = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.mongo_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "mongo" {
  source = "../../modules/mongo"

  db_username = var.db_username
  db_password = var.db_password
  namespace = var.mongo_namespace
  instance_class = var.instance_type
  engine_version = var.engine_version
  sg_ids = [module.mongo_security_group.sg_id]
}

