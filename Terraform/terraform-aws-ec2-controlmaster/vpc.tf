# Aqui dizemos apenas que a instancia deve usar a VPC default
resource "aws_default_vpc" "default_vpc" {
   tags = {
    Name    = "controlmaster_vpc"
    Terraform   = "true"
    Environment = "control"
  } 
}