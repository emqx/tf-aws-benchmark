# locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }
locals { timestamp = formatdate("DD-MMM-YYYY-hh:mm", timestamp()) }

// Configure the EC2 instance in a private subnet
resource "aws_instance" "ec2" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  subnet_id                   = var.vpc.public_subnets[0]
  vpc_security_group_ids      = var.sg_ids
  user_data = "${file("${path.module}/user_data/init.sh")}"

  tags = {
    "Name" = "${var.namespace}-EC2-${local.timestamp}"
  }
}