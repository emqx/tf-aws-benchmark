pgsql_ingress_with_cidr_blocks = [
  {
    description = "port of pgsql"
    from_port   = 5432
    to_port     = 5432
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