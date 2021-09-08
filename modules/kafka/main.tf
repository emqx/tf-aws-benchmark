resource "aws_kms_key" "kms" {
  description = "kms"
}

resource "aws_cloudwatch_log_group" "test" {
  name = "${var.cluster_name}-msk-broker-logs"
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.instance_count

  broker_node_group_info {
    instance_type   = var.instance_type
    ebs_volume_size = var.ebs_volume_size
    client_subnets  = var.subnet_ids
    security_groups = var.sg_ids
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.test.name
      }
    }
  }
}

resource "aws_msk_configuration" "kafka" {
  kafka_versions = [var.kafka_version]
  name           = "${var.cluster_name}-configuration"

  server_properties = <<PROPERTIES
auto.create.topics.enable = true
delete.topic.enable = true
default.replication.factor = ${var.replication_factor}
num.partitions = ${var.number_partitions}
PROPERTIES
}