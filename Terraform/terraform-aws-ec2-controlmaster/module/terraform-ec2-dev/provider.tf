provider "aws"{
   region="us-east-1"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_key_pair" "controller" {
  key_name = "controller"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ansible_sg" {
  name        = "ansible_servers"
  description = "ALLOW COMMUNICATION"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${aws_default_vpc.default.cidr_block}"]
  }

  ingress {
    description      = "HTTP over internet"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Ansible Servers"
  }

resource "aws_instance" "ubuntu"{
  ami="ami-00742e66d44c13cd9"
  instance_type="t2.micro"

  key_name=aws_key_pair.controller.key_name

  security_groups = [ "${aws_security_group.ansible_sg.name}" ]

  tags= {
    Name="Ubuntu 1"
  }
 }
}
