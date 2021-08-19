variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "sg_ids" {
  type = list(string)
}

variable "instance_count" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "ebs_volume_size" {
  type = number
}

variable "kafka_version" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "replication_factor" {
  type = number
}

variable "number_partitions" {
  type = number
}