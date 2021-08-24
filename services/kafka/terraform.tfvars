## common

kafka_namespace = "tf-kafka"


## vpc

kafka_ingress_with_cidr_blocks = [
  {
    description = "port of kafka"
    from_port   = 9094
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "port of zookeeper"
    from_port   = 2181
    to_port     = 2181
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  }
]

egress_with_cidr_blocks = [
  {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
]

## ec2
associate_public_ip_address = true