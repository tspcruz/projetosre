# Exibe IP da instancia gerada
output "op1"{
value = aws_instance.vm_controle.public_ip
}

# Exibe status da instancia
#output "op2"{
#value = aws_instance.vm_controle.instance_state
#}

