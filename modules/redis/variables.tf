variable "namespace" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "sg_ids" {
  type = list(string)
}

variable "private_key" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

