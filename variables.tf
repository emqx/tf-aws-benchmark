## common

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "access_key" {
  description = "AWS access key"
  type        = string
  default     = null
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  default     = null
}

variable "emqx_namespace" {
  description = "emqx namespace"
  type        = string
  default     = "tf-emqx"
}

variable "kafka_namespace" {
  description = "kafka namespace"
  type        = string
  default     = "tf-kafka"
}

## vpc

variable "subnet_cidr_blocks" {
  description = "subnets of vpc"
  type = list(string)
  default = [
      "172.31.101.0/24",
      "172.31.102.0/24",
      "172.31.103.0/24",
      "172.31.104.0/24",
      "172.31.105.0/24",
      "172.31.106.0/24",
      "172.31.107.0/24",
      "172.31.108.0/24",
      "172.31.109.0/24",
      "172.31.110.0/24",
      "172.31.111.0/24",
      "172.31.112.0/24"
    ]
}

variable "emqx_ingress_with_cidr_blocks" {
  description = "ingress of emqx with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "kafka_ingress_with_cidr_blocks" {
  description = "ingress of kafka with cidr blocks"
  type        = list(any)
  default     = [null]
}

## ec2

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = true
}

variable "ami" {
  description = "AMI to use for the instance"
  // Get the ami from the output of the packer
  type    = string
  default = null
}

variable "private_key" {
  description = "ssh private key"
  type        = string
  default     = null
}

variable "emqx_package" {
  description = "emqx installation package"
  type        = string
  default     = null
}

variable "key_name" {
  description = "the name of key"
  type        = string
  default     = "aws-sg-bench"
}

variable "emqx_lic" {
  description = "the name of key"
  type        = string
  default     = null
}

variable "os" {
  description = "os"
  type        = string
  default     = "ubuntu"
}

variable "emqx_instance_count" {
  description = "Instance count of emqx"
  type        = number
  default     = 3
}

variable "emqx_instance_type" {
  description = "Instance type of emqx"
  type        = string
  default     = "t2.micro"
}

# kafka
variable "kafka_instance_type" {
  description = "Instance type of kafka"
  type        = string
  default     = "kafka.m5.large"
}

variable "kafka_instance_count" {
  description = "Instance count of kafka"
  type        = number
  default     = 3
}

variable "kafka_version" {
  description = "Version of kafka"
  type = string
  default = "2.6.2"
}

variable "kafka_ebs_volume_size" {
  description = "The size in GiB of the EBS volume"
  type = number
  default = 1000
}

variable "kafka_cluster_name" {
  description = "The cluster name of kafka"
  type = string
  default = "kafka"
}

variable "kafka_replication_factor" {
  description = "Enables autocreation of a topic on the server"
  type = number
  default = 3
}

variable "kafka_number_partitions" {
  description = "The number of log partitions per topic"
  type = number
  default = 6
}

