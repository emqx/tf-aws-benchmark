variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable "sg_ids" {
  type = list(string)
}

variable "associate_public_ip_address" {
    type = bool
}

variable "instance_type" {
    type = string
}

variable "private_key" {
  type = string
}

variable "emqx_package" {
  type = string
}