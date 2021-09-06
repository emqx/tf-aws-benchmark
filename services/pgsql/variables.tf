## common

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "pgsql_namespace" {
  description = "pgsql namespace"
  type        = string
  default     = "tf-pgsql"
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

variable "pgsql_subnet_cidr_blocks" {
  description = "subnets of vpc"
  type = list(string)
  default = [
      "172.31.140.0/24",
      "172.31.141.0/24"
    ]
}

## security group

variable "egress_with_cidr_blocks" {
  description = "egress with cidr blocks"
  type        = list(any)
  default     = [null]
}

variable "pgsql_ingress_with_cidr_blocks" {
  description = "ingress of pgsql with cidr blocks"
  type        = list(any)
  default     = [null]
}

## rds

variable "engine" {
  type        = string
  default     = "postgres"
  description = "The engine of rds"
}

variable "pgsql_engine_version" {
  type        = string
  default     = "13.3"
  description = "The engine version of pgsql"
}

variable "db_id" {
  type        = string
  default     = "tf-pgsql"
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
  default     = "mqtt"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "test"
}
