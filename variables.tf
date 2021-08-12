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

variable "namespace" {
  description = "namespace"
  type        = string
  default     = "tf"
}

## vpc

# variable "vpc_cidr_block" {
#   description = "cidr of vpc"
#   type = string
#   default = "10.0.0.0/16"
# }

# variable "private_subnet_cidr_blocks" {
#   description = "private subnets of vpc"
#   type = list(string)
#   default = [
#     "10.0.1.0/24",
#     "10.0.2.0/24",
#     "10.0.3.0/24",
#     "10.0.4.0/24",
#     "10.0.5.0/24",
#     "10.0.6.0/24",
#     "10.0.7.0/24",
#     "10.0.8.0/24",
#     "10.0.9.0/24",
#     "10.0.10.0/24",
#     "10.0.11.0/24",
#     "10.0.12.0/24",
#     "10.0.13.0/24",
#     "10.0.14.0/24",
#     "10.0.15.0/24",
#     "10.0.16.0/24"
#   ]
# }

# variable "public_subnet_cidr_blocks" {
#   description = "public subnets of vpc"
#   type = list(string)
#   default = [
#   "10.0.101.0/24",
#   "10.0.102.0/24",
#   "10.0.103.0/24",
#   "10.0.104.0/24",
#   "10.0.105.0/24",
#   "10.0.106.0/24",
#   "10.0.107.0/24",
#   "10.0.108.0/24",
#   "10.0.109.0/24",
#   "10.0.110.0/24",
#   "10.0.111.0/24",
#   "10.0.112.0/24",
#   "10.0.113.0/24",
#   "10.0.114.0/24",
#   "10.0.115.0/24",
#   "10.0.116.0/24"
# ]
# }

# variable "subnets_per_vpc" {
#   description = "Number of subnets of per vpc"
#   type = string
#   default = 1
# }

# variable "emqx_instances_per_subnet" {
#   description = "Number of instances of per vpc of emqx"
#   type = string
#   default = 3
# }

variable "emqx_ingress_with_cidr_blocks" {
  description = "ingress with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
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

