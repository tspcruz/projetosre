S3 Remote State Example
This folder contains example Terraform configuration that create an S3 bucket and DynamoDB table in an Amazon Web Services (AWS) account. The S3 bucket and DynamoDB table can be used as a remote backend for Terraform.

For more info, please see Chapter 3, "How to Manage Terraform State", of Terraform: Up and Running.

Pre-requisites
You must have Terraform installed on your computer.
You must have an Amazon Web Services (AWS) account.
Please note that this code was written for Terraform 1.x.

Quick start
Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure all the resources qualify for the AWS Free Tier, but we are not responsible for any charges you may incur.

Configure your AWS access keys as environment variables:

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
Specify a name for the S3 bucket and DynamoDB table in variables.tf using the default parameter:

No arquivo terraform.tfvars definir os valores:

region      = "Região que será gerado o S3"
bucket_name = "Nome do bucket"
table_name  = "Nome da tabela DynamoDb"

Deploy the code:

terraform init
terraform apply

Clean up when you're done:

terraform destroy