## common

region = "us-east-2"
namespace = "tf-basic"


## vpc

cidr = "10.0.0.0/16"
private_subnets = ["10.0.1.0/24"]
public_subnets = ["10.0.101.0/24"]
ingress_with_cidr_blocks = [
    {
      description = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "mqtt"
      from_port   = 1883
      to_port     = 1883
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "mqtts"
      from_port   = 8883
      to_port     = 8883
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "ws"
      from_port   = 8083
      to_port     = 8083
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "wss"
      from_port   = 8084
      to_port     = 8084
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

## ec2
associate_public_ip_address = true
ami = "ami-0f42ce11689cf44a7"
instance_type = "t2.micro"

