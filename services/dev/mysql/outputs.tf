# output "address" {
#   value       = module.mysql.address
#   description = "Connect to the database at this endpoint"
# }

# output "port" {
#   value       = module.mysql.port
#   description = "The port the database is listening on"
# }

output "endpoint" {
  value       = module.mysql.endpoint
  description = "The endpoint the database is listening on"
}
