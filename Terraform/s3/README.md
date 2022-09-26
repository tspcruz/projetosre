S3 Remote State
Projeto criar S3 bucket e uma tabela no DynamoDB, onde podem ser utilizado com backend para o Terraform.

Configurar AWS access keys como variáveis do sistema:

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)

No arquivo terraform.tfvars definir os valores:

region      = "Região que será gerado o S3"
bucket_name = "Nome do bucket"
table_name  = "Nome da tabela DynamoDb"


terraform init
terraform apply
