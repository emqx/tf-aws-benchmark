output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "public_dns" {
  value = aws_instance.ec2.public_dns
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "instance_id" {
  value = aws_instance.ec2.arn
}