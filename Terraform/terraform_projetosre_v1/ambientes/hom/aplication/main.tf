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

provider "aws" {
  region = var.region
}

module "aplicacao" {

  source = "../../../modules/aplication"
  
  environment            = var.environment

  instance_type      = "t2.micro"
  min_size           = 1
  max_size           = 3
  desired_capacity   = 1
  min_size_scaling_night           = 1
  max_size_scaling_night           = 2
  desired_capacity_scaling_night   = 1
  enable_autoscaling = true
  region = var.region
  keyname = var.keyname
  
  ami                = "ami-00742e66d44c13cd9"
  #data.aws_ami.ubuntu.id
  

}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}