variable "region" {
  type = string
}

variable "namespace" {
  type = string
}

variable "cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "ingress_with_cidr_blocks" {
  type = list(any)
}