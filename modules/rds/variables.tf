
variable "db_name" {
  description = "The name to use for the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the database"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage for the database"
  type        = number
}

variable "subnet_ids" {
  description = "The subnet ids for mysql"
  type = list(string)
}

variable "sg_ids" {
  description = "The security group ids for mysql"
  type = list(string)
}

variable "namespace" {
  description = "The namespace for mysql"
  type        = string
}

variable "identifier" {
  type        = string
  description = "The name of the RDS instance"
}

variable "engine" {
  type        = string
  description = "The engine of the RDS instance"
}

variable "engine_version" {
  type        = string
  description = "The version of the engine of the RDS instance"
}