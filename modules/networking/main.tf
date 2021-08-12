# data "aws_availability_zones" "available" {
#   state = "available"
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   name                             = "${var.namespace}-vpc"
#   cidr = var.cidr
#   azs                              = data.aws_availability_zones.available.names
#   private_subnets = var.private_subnets
#   public_subnets = var.public_subnets
# }


resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet_ids" "emqx" {
  vpc_id = aws_default_vpc.default.id
}
