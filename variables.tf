## common

variable "region" {
  description = "AWS region"
  default     = "us-east-2"
  type        = string
}

variable "namespace" {
  description = "namespace"
  default     = "tf-basic"
  type        = string
}

## vpc

variable "cidr" {
  description = "cidr of vpc"
  default = "10.0.0.0/16"
  type = string
}

variable "private_subnets" {
  description = "private subnets of vpc"
  default = ["10.0.1.0/24"]
  type = list(string)
}

variable "public_subnets" {
  description = "public subnets of vpc"
  default = ["10.0.101.0/24"]
  type = list(string)
}

variable "ingress_with_cidr_blocks" {
  description = "ingress with cidr blocks"
  default = [null]
  type = list(any)
}

## ec2

variable "associate_public_ip_address" {
    description = "Whether to associate a public IP address with an instance in a VPC"
    default = true
    type = bool
}

variable "ami" {
    description = "AMI to use for the instance"
    // Get the ami from the output of the packer
    default = null
    type = string
}

variable "instance_type" {
    description = "Type of instance to start"
    default = "t2.micro"
    type = string
}
