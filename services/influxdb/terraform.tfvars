## common

influxdb_namespace = "tf-influxdb"

## vpc

influxdb_ingress_with_cidr_blocks = [
  {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "port of influxdb web admin"
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "port of influxdb http"
    from_port   = 8086
    to_port     = 8086
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

## influxdb ec2
influxdb_instance_type = "t2.xlarge"