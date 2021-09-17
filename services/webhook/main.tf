# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#######################################
## webhookdb modules
#######################################

module "webhook_networking" {
  source = "../../modules/networking"

  namespace          = var.webhook_namespace
  vpc_id             = aws_default_vpc.default.id
  subnet_cidr_blocks = slice(var.subnet_cidr_blocks, 0, var.webhook_instance_count)
}

module "webhook_security_group" {
  source = "../../modules/security_group"

  namespace                = var.webhook_namespace
  vpc_id                   = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.webhook_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "webhook" {
  source                      = "../../modules/webhook"
  namespace                   = var.webhook_namespace
  associate_public_ip_address = var.associate_public_ip_address
  subnet_ids                  = module.webhook_networking.subnet_ids
  sg_ids                      = [module.webhook_security_group.sg_id]
  private_key                 = var.private_key
  key_name                    = var.key_name
  instance_type               = var.webhook_instance_type
}

