# output "address" {
#   value       = aws_db_instance.mysql.address
#   description = "Connect to the database at this endpoint"
# }

# output "port" {
#   value       = aws_db_instance.mysql.port
#   description = "The port the database is listening on"
# }

output "endpoint" {
  value       = aws_db_instance.rds.endpoint
  description = "Connect to the database at this endpoint"
}