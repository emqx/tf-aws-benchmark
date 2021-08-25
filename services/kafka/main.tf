# Default VPC

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


#######################################
## kafka modules
#######################################

module "kafka_networking" {
  source = "../../modules/networking"

  namespace = var.kafka_namespace
  vpc_id = aws_default_vpc.default.id
  subnet_cidr_blocks = var.subnet_cidr_blocks
}

module "kafka_security_group" {
  source = "../../modules/security_group"

  namespace                = var.kafka_namespace
  vpc_id = aws_default_vpc.default.id
  ingress_with_cidr_blocks = var.kafka_ingress_with_cidr_blocks
  egress_with_cidr_blocks  = var.egress_with_cidr_blocks
}

module "kafka" {
  source = "../../modules/kafka"

  cluster_name = var.kafka_cluster_name
  vpc_id = aws_default_vpc.default.id
  instance_count = var.kafka_instance_count
  instance_type = var.kafka_instance_type
  kafka_version = var.kafka_version
  ebs_volume_size = var.kafka_ebs_volume_size
  subnet_ids   = module.kafka_networking.subnet_ids
  sg_ids       = [module.kafka_security_group.sg_id]
  replication_factor = var.kafka_replication_factor
  number_partitions = var.kafka_number_partitions
}

