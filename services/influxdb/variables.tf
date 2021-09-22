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

variable "influxdb_namespace" {
  description = "influxdb namespace"
  type        = string
  default     = "tf-influxdb"
}

## vpc

variable "subnet_cidr_blocks" {
  description = "subnets of vpc"
  type        = list(string)
  default = [
    "172.31.180.0/24"
  ]
}

variable "influxdb_ingress_with_cidr_blocks" {
  description = "ingress of influxdb with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}


## influxdb ec2

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
  default     = "emqx-ci-robor"
}

variable "influxdb_instance_count" {
  description = "Instance count of influxdb"
  type        = number
  default     = 1
}

variable "influxdb_instance_type" {
  description = "Instance type of influxdb"
  type        = string
  default     = "t2.xlarge"
}