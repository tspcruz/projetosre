Para subir o ambiente.

* Subir ambiente Banco e na sequencia Aplicação 
* Ponto a melhorar -- Configurar Pipeline no Jenkins para controle da infra e execução dos scripts do Terraform
* Subir a partir da maquina de controle
* Gerar Keypairs que serão utilizados nas instancias ECS que são implementadas com Auto Scalling

1 -  Definir variáveis do usuário e senha do banco
  export TF_VAR_username=
  export TF_VAR_password=

2 - No diretório do respetivo ambiente executar o comando abaixo
 Exemplo - Ambiente Homologacao
 
 Terraform init
 Terraform plan
 Terraform apply
 
 3 - Dentro das pastas ambientes, existe uma pasta para cada ambiente (dev,hom,prd). Onde a chamada do Terraform deve ser realizada considerando cada ambiente. Além disso pode ser parametrizado.
 
 Exemplo:
 
 Pode ser escolhido tipo de instancia, configuração para o cluster EC2, referente a capacidade minha e máxima, possibilidade de reduzir capacidade do cluster durante noite, poder habilitar ou não o auto scalling, escolher a imagem a ser utilizada. 
 
 *Região, está sendo utilizada via arquivo TFvars, a região de São Paulo. O cluster utilizado mais de uma availability zones, no caso ele distribui as instancias geradas em mais de uma availability zones. 
 
Caso as maquinas sejam provisionadas novamente, a estratégia de deploy escolhida foi a Rolling Deploy, serão mantidas algumas instancias com a versão antiga da aplicação durante um período em conjunto com novas instancias com versão nova da aplicação. 
 Durante o provisionamento é chamado um script de bootstrap.sh no qual seu objetivo é configuração inicial das instancias e baixar versão nova da aplicação do Jfrog (A ser implementado parte de integração com Jfrog). 
 
Prometheus e Grafana (A ser implementado)

A ideia é instrumentar as instancias e conteiners da aplicação, além da própria máquina de controle. Assim sendo possível colher os dados e integrar com o servidor do Prometheus. Fora isso para parte de banco de dados e da própria aplicação a ideia seria utilizar módulo que permita exportar dados do CloudWatch para o Prometheus para complementar os dados. 

 * Está configurado e sendo utilizado o Cloudwatch para aplicação (Cluster, Loadbalance e instancias EC2) e banco de dados RDS (tanto para instancia master do banco como para a réplica).
 


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

