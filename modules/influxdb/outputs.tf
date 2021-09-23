//output "endpoint" {
//  value       = aws_instance.mongo.private_ip
//  description = "Connect to the database at this endpoint"
//}

output "public_ip" {
  value = aws_instance.influxdb.public_ip
}

output "private_ip" {
  value = aws_instance.influxdb.private_ip
}
