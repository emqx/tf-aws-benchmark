resource "aws_db_subnet_group" "mysql" {
  name       = "${var.namespace}-db-sn-gp"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.namespace}-db-sn-gp"
  }
}

resource "aws_db_instance" "mysql" {
  engine              = "mysql"
  identifier = var.identifier

  allocated_storage   = var.allocated_storage
  instance_class      = var.instance_class
  name                = var.db_name
  username            = var.db_username
  db_subnet_group_name    = aws_db_subnet_group.mysql.name
  password            = var.db_password
  vpc_security_group_ids = var.sg_ids
  engine_version = "8.0"
  skip_final_snapshot = true
  publicly_accessible = true
}
