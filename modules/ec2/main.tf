locals { timestamp = formatdate("DD-MMM-YYYY-hh:mm", timestamp()) }

data "aws_ami" "ubuntu" {
  most_recent      = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# resource "aws_ami" "emqx" {
#   arn =  data.aws_ami.emqx.id
#   name                = "${var.namespace}-AMI-${local.timestamp}"
# }

// Configure the EC2 instance in a public subnet
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = var.instance_type
  subnet_id                   = var.vpc.public_subnets[0]
  vpc_security_group_ids      = var.sg_ids
  # user_data = "${file("${path.module}/user_data/init.sh")}"
  key_name = "aws-bench"

  connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      # private_key = file("/Users/yummy/.ssh/aws-bench")
      private_key = var.private_key
  }

  # scp emqx
  provisioner "file" {
    # source      = "${path.module}/emqx.zip"
    source      = var.emqx_package
    destination = "/tmp/emqx.zip"
  }

  # init system
  provisioner "file" {
    source      = "${path.module}/scripts/init.sh"
    destination = "/tmp/init.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh",
    ]
  }

  root_block_device {
    iops = 3000
    throughput = 125
    volume_size = 50
    volume_type = "gp3"
  }

  tags = {
    "Name" = "${var.namespace}-EC2-${local.timestamp}"
  }
}