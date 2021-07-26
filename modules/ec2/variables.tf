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

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}
