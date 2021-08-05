module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.namespace}-sg"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks = var.egress_with_cidr_blocks
}