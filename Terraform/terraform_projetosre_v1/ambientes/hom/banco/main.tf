terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  backend "s3" {
    bucket         = "mys3sre"
    key            = "devenv/terraform.tfstate"
    region         = "sa-east-1"
    encrypt        = "true"
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

module "database" {
  source = "../../../modules/database"
  identifier             = var.identifier
  #name                   = "dbdev"
  machinename            = var.machinename
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.4"
  environment            = var.environment
  password               = var.password
  username               = var.username
}

# Outras opções freetier db.t4g.micro