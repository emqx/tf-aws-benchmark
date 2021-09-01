# terraform {
#   backend "s3" {

#     # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
#     # manually, uncomment and fill in the config below.

#     bucket         = "test.tf-test-automation"
#     key            = "mysql/terraform.tfstate"
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

module "mysql_networking" {
  source = "../../../modules/networking"

  namespace = var.mysql_namespace
  vpc_id = aws_default_vpc.default.id
  subnet_cidr_blocks = var.subnet_cidr_blocks
}

module "mysql_security_group" {
  source = "../../../modules/security_group"

  namespace                = var.mysql_namespace
  vpc_id = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.mysql_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "mysql" {
  source = "../../../modules/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  namespace = var.mysql_namespace
  identifier = var.db_id
  sg_ids = [module.mysql_security_group.sg_id]
  allocated_storage = var.allocated_storage
  instance_class = var.instance_type
  subnet_ids = module.mysql_networking.subnet_ids
}
