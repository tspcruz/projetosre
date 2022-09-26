# Aqui definimos um SecurityGroup que terá o acesso de qualquer lugar para porta 22 e 80
resource "aws_security_group" "allow_services" {
  name        = "vm_controle"
  description = "Grupo de seguranca para maquina vm_controle"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Full Out"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG_controle"
  }
}
