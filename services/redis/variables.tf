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

variable "redis_namespace" {
  description = "redis namespace"
  type        = string
  default     = "tf-redis"
}

## vpc

variable "subnet_cidr_blocks" {
  description = "subnets of vpc"
  type        = list(string)
  default = [
    "172.31.150.0/24"
  ]
}

variable "redis_ingress_with_cidr_blocks" {
  description = "ingress of redis with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}

## redis ec2

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = true
}

variable "private_key" {
  description = "ssh private key"
  type        = string
  default     = null
}

variable "key_name" {
  description = "the name of key"
  type        = string
  default     = "aws-sg-bench"
}

variable "redis_instance_count" {
  description = "Instance count of redis"
  type        = number
  default     = 1
}

variable "redis_instance_type" {
  description = "Instance type of redis"
  type        = string
  default     = "t2.xlarge"
}
