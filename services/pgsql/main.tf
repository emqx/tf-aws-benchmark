# terraform {
#   backend "s3" {

#     # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
#     # manually, uncomment and fill in the config below.

#     bucket         = "test.tf-test-automation"
#     key            = "pgsql/terraform.tfstate"
#     region         = "ap-southeast-1"
#     dynamodb_table = "tf-test-automation"
#     encrypt        = true
#   }
# }

# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

module "pgsql_networking" {
  source = "../../modules/networking"

  namespace          = var.pgsql_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = var.pgsql_subnet_cidr_blocks
}

module "pgsql_security_group" {
  source = "../../modules/security_group"

  namespace                = var.pgsql_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.pgsql_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "pgsql" {
  source = "../../modules/rds"

  engine            = var.engine
  engine_version    = var.pgsql_engine_version
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  namespace         = var.pgsql_namespace
  identifier        = var.db_id
  sg_ids            = [module.pgsql_security_group.sg_id]
  allocated_storage = var.allocated_storage
  instance_class    = var.instance_type
  subnet_ids        = module.pgsql_networking.subnet_ids
}
