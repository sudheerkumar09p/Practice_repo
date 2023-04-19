provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet" "subnet1" {
  id = var.subnet_id
}

resource "aws_network_interface" "network_interface" {
  count     = var.ec2_count
  subnet_id = data.aws_subnet.subnet1.id

  tags = {
    Name = "primary_network_interface-${count.index}"
  }
}

resource "aws_instance" "instance" {
  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.network_interface[count.index].id
    device_index         = 0
  }

  tags = {
    Name = "instance-${count.index}"
  }
}