## common

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "mongo_namespace" {
  description = "mongo namespace"
  type        = string
  default     = "tf-mongo"
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

## vpc

# variable "subnet_cidr_blocks" {
#   description = "subnets of vpc"
#   type = list(string)
#   default = [
#       "172.31.120.0/24",
#     ]
# }


## security group

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "mongo_ingress_with_cidr_blocks" {
  description = "ingress of mongo with cidr blocks"
  type        = list(any)
  default     = [null]
}


## mongo

variable "db_username" {
  type        = string
  default     = "test"
  description = "The username for the database"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
}

variable "instance_type" {
  type        = string
  default     = "db.r5.large"
  description = "The db instance type"
}

variable "engine_version" {
  type        = string
  default     = "4.0.0"
  description = "The version of engine for mongo"
}
