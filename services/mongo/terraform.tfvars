mongo_ingress_with_cidr_blocks = [
  {
    description = "port of mongo"
    from_port   = 27017
    to_port     = 27017
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