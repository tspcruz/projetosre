# projsre
projeto sre

Foi utilizado o terraform para provisionar na AWS a parte de infra conforme abaixo:

Uma maquina de controle -- Instancia EC2
terraform-aws-ec2-controlmaster -- Ditório com scripts do Terraform (Em andamento)
 Objetivo da maquina:
  Jenkins para controle das pipelines de deploy (Dev, Hom e Prd). Alem de pipelines de controle de Infra ( Disparar terraform init, destroy,etc)
  Prometheus e Grafana
  Ansible (Para parte de configuração das maquinas -- Em andamento)

Foi implementado um projeto no Terraform com nome s3. Seu objetivo é de utilizar AWS S3 para guardar os arquivos TFstate do terraform de forma segura, alem do S3 está sendo utilizo um Dynamodb para guardar o ID do TFstates. Esta mesma estrutura pode ser utilizado por varios outros projetos.

Foi implementado um projeto no Terraform com nome terraform_projetosre_v1. Seu objetivo é automatizar a administração dos ambientes de desenvolvimento, homologação e produção. O mesmo foi construido para implementar um Cluster de maquinas EC2 com auto scalling e implementando um loadbalance utilizando o AWS ALB, essa estrutura para atendar a aplicação, alem disso o script foi implementado de forma a ter reaproveitamento onde temos modulos com funções genericas para todos os ambientes e projetos pricipais que utilizam os modulos segmentados por ambiente. Fora isso para a configuração do Auto scalling, foi implementado um redução de capacidade para madrugada. Para parte de banco de dados, foi implementado scripts para implementação de do Banco Postgres 14, utilizando o AWS RDS, onde para homologação de produção é possivel subir instancia do banco com réplica, alem da configuração para backup automático entre as 00 e as 03 da manha.

Em relação a parte de deploy, foi configurado no projeto do Terraform, para parte da aplicação, a estratégia de deploy Rolling deploy. 
A ideia para aplicação de que quando for realizado um commit de uma nova versão 




# Configurar credenciais AWS
export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
export AWS_DEFAULT_REGION=

# Configurar conta GIT
 git config --global user.email "asd@email.com"
 git config --global user.name "usuariogit"

 # Clonar projeto de Infra do GIT
 git clone https://@github.com/tspcruz/projsre.git](https://github.com/tspcruz/projetosre.git)
