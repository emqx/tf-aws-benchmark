output "endpoint" {
  value       = aws_docdb_cluster.mongo.endpoint
  description = "Connect to the database at this endpoint"
}