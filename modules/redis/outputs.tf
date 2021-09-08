output "public_ip" {
  value = aws_instance.redis.public_ip
}

output "private_ip" {
  value = aws_instance.redis.private_ip
}
