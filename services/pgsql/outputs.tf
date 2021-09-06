# output "address" {
#   value       = module.pgsql.address
#   description = "Connect to the database at this endpoint"
# }

# output "port" {
#   value       = module.pgsql.port
#   description = "The port the database is listening on"
# }

output "endpoint" {
  value       = module.pgsql.endpoint
  description = "The endpoint the database is listening on"
}
