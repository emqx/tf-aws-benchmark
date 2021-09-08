# terraform {
#   backend "s3" {

#     # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
#     # manually, uncomment and fill in the config below.

#     bucket         = "test.tf-test-automation"
#     key            = "emqx/terraform.tfstate"
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

#######################################
## emqx modules
#######################################

module "emqx_networking" {
  source = "../../modules/networking"

  namespace          = var.emqx_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.emqx_instance_count)
}

module "emqx_security_group" {
  source = "../../modules/security_group"

  namespace                = var.emqx_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.emqx_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "emqx_ec2" {
  source = "../../modules/ec2"

  namespace                   = var.emqx_namespace
  instance_count              = var.emqx_instance_count
  instance_type               = var.emqx_instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_ids                  = module.emqx_networking.subnet_ids
  sg_ids                      = [module.emqx_security_group.sg_id]
  private_key                 = var.private_key
  emqx_package                = var.emqx_package
  key_name                    = var.key_name
  emqx_lic                    = var.emqx_lic
  os                          = var.os
}
