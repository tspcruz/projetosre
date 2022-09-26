terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  
  subnets            = var.subnet_ids

  security_groups    = [aws_security_group.albsg.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = local.http_port
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

resource "aws_security_group" "albsg" {
  name = var.alb_name
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.albsg.id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips

}
# Teste Remover
#resource "aws_security_group_rule" "allow_ssh_inbound" {
#  type              = "ingress"
#  security_group_id = aws_security_group.albsg.id

#  from_port   = local.from_port
#  to_port     = local.to_port
#  protocol    = local.protocol
#  cidr_blocks = local.all_ips
#}

# Teste remover
#resource "aws_security_group_rule" "allow_all_outbound" {
#  type              = "egress"
#  security_group_id = aws_security_group.albsg.id

#  from_port   = local.from_port
#  to_port     = local.to_port
#  protocol    = local.any_protocol
#  cidr_blocks = local.all_ips
#}

locals {
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
  #from_port        = 22
  #to_port          = 22
  #protocol         = "tcp"
}