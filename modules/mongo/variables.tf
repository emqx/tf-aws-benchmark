
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

variable "namespace" {
  description = "The namespace for mongo"
  type        = string
}

variable "engine_version" {
  description = "The version of engine for mongo"
  type        = string
}

variable "sg_ids" {
  description = "The security group ids for mongo"
  type        = list(string)
}
