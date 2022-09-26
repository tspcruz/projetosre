terraform {
  required_version = ">= 1.0.0, < 2.0.0"

backend "s3" {
    bucket = "mys3sre"
    key    = "devenv/terraform.tfstate"
    region = "sa-east-1"
    encrypt = "true"
    dynamodb_table = "mys3table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#Criar Instancia EC2 para VM Controle
resource "aws_instance" "vm_controle" {
    ami = "ami-00742e66d44c13cd9"
    instance_type = "t2.micro"
    key_name = "control_key"
    vpc_security_group_ids = [aws_security_group.allow_services.id]
    tags = {
    Name    = "controlmaster"
    Terraform   = "true"
    Environment = "control"
  }
    user_data = "${file("bootstrap.sh")}"  
}

#Criar Volume EBS
resource "aws_ebs_volume" "ebs"{
  availability_zone =  aws_instance.vm_controle.availability_zone
  size              = 3
  tags = {
    Name = "ebs_vmcontrole"
  }
}
#Associa Volume EBS a instancia EC2
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.vm_controle.id
  force_detach = true
}

