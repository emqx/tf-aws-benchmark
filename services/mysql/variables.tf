## common

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "mysql_namespace" {
  description = "mysql namespace"
  type        = string
  default     = "tf-mysql"
}

## vpc

variable "subnet_cidr_blocks" {
  description = "subnets of vpc"
  type = list(string)
  default = [
      "172.31.210.0/24",
      "172.31.211.0/24"
    #   "172.31.212.0/24"
    #   "172.31.213.0/24"
    ]
}


## security group

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "mysql_ingress_with_cidr_blocks" {
  description = "ingress of mysql with cidr blocks"
  type        = list(any)
  default     = [null]
}


## mysql

variable "db_id" {
  type        = string
  default     = "tf"
  description = "description"
}


variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "instance_type" {
  type        = string
  default     = "db.t3.micro"
  description = "db instance type"
}

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "db allocated storage"
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "emqx"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
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
