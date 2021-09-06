output "public_ip" {
  value = aws_instance.pulsar.public_ip
}

output "private_ip" {
  value = aws_instance.pulsar.private_ip
}
