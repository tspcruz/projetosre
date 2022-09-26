Para subir o ambiente.

* Subir ambiente Banco e na sequencia Aplicação 
* Ponto a melhorar -- Configurar Pipeline no Jenkins para controle da infra e execução dos scripts do Terraform
* Subir a partir da maquina de controle
* Gerar Keypairs que serão utilizados nas instancias ECS que são implementadas com Auto Scalling

1 -  Definir variaveis do usuário e senha do banco
  export TF_VAR_username=
  export TF_VAR_password=

2 - No diretório do respetivo ambiente executar o comando abaixo
 Exemplo - Ambiente Homologacao
 
 Terraform init
 Terraform plan
 Terraform apply

