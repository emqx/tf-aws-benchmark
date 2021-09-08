resource "aws_db_subnet_group" "rds" {
  name       = "${var.namespace}-db-sn-gp"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.namespace}-db-sn-gp"
  }
}

resource "aws_db_instance" "rds" {
  engine         = var.engine
  engine_version = var.engine_version

  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  instance_class         = var.instance_class
  name                   = var.db_name
  username               = var.db_username
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  password               = var.db_password
  vpc_security_group_ids = var.sg_ids
  skip_final_snapshot    = true
  publicly_accessible    = true
}
