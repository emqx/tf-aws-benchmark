# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   name                             = "${var.namespace}-vpc"
#   cidr = var.cidr
#   azs                              = ["${var.region}a"]
#   private_subnets = var.private_subnets
#   public_subnets = var.public_subnets
#   enable_dns_support   = true
#   enable_dns_hostnames = true
# }

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" "emqx" {
  vpc_id = aws_default_vpc.default.id
}

# data "aws_subnet" "emqx" {
#   for_each = data.aws_subnet_ids.emqx.ids
#   id       = each.value
# }

module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.namespace}-sg"
  description = "security group for emqx"
  vpc_id      = aws_default_vpc.default.id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks = var.egress_with_cidr_blocks
}