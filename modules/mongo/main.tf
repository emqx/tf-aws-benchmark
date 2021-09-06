resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "${var.namespace}-${count.index}"
  cluster_identifier = aws_docdb_cluster.mongo.id
  instance_class     = var.instance_class
}

resource "aws_docdb_cluster" "mongo" {
  cluster_identifier = "${var.namespace}"
  engine_version = var.engine_version
  master_username    = var.db_username
  master_password    = var.db_password
  vpc_security_group_ids = var.sg_ids
  skip_final_snapshot = true
}
