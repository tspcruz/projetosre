terraform {
  # Require any 1.x version of Terraform
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "sgdb" {
  vpc_id      = "${data.aws_vpc.default.id}"
  name        = "sgdb_${var.environment}"
  description = "Allow all inbound for Postgres"
ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_parameter_group" "prmgroup" {
  name   = "${var.environment}"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "dbinstance" {
  identifier             = "${var.identifier}${var.environment}"
  db_name                = "${var.identifier}${var.environment}"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.sgdb.id]
  parameter_group_name   = aws_db_parameter_group.prmgroup.name
  username               = var.username
  password               = var.password

  # Backups are required in order to create a replica
  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 1
}

resource "aws_db_instance" "dbreplica-read" {
  identifier             = "${var.identifier}${var.environment}-replica"
  replicate_source_db    = aws_db_instance.dbinstance.identifier ## refer to the master instance
  #name                   = "rep_${var.identifier}_${var.environment}"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  #engine                 = var.engine
  #engine_version         = aws_db_instance.dbinstance.engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.sgdb.id]
  parameter_group_name   = aws_db_parameter_group.prmgroup.name
# Username and password must not be set for replicas
  #username = ""
  #password = ""
# disable backups to create DB faster
  backup_retention_period = 0
}

