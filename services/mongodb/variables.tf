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

variable "mongo_namespace" {
  description = "mongo namespace"
  type        = string
  default     = "tf-mongo"
}

## vpc

variable "subnet_cidr_blocks" {
  description = "subnets of vpc"
  type        = list(string)
  default = [
    "172.31.160.0/24"
  ]
}

variable "mongo_ingress_with_cidr_blocks" {
  description = "ingress of mongo with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}


## mongo ec2

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

variable "db_username" {
  type        = string
  default     = "test"
  description = "The username for the database"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
}

//variable "engine_version" {
//  type        = string
//  default     = "4.0.0"
//  description = "The version of engine for mongo"
//}


variable "mongo_instance_count" {
  description = "Instance count of mongo"
  type        = number
  default     = 1
}

variable "mongo_instance_type" {
  description = "Instance type of mongo"
  type        = string
  default     = "t2.xlarge"
}