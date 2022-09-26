# projsre

projeto sre

Branch separada para aplicação e banco de dados. Para aplicação conforme novas versões forem implementadas será implementada uma nova imagem do docker. Onde caso a pipeline para o respetivo ambiente execute com sucesso, está imagem com a nova versão da aplicação será publicada no Jfrog. Sequencialmente dependendo da pipeline poderá ser realizado o deploy desta nova versão, onde será disparado via pipeline de infra no jenkins o provisionamento de novas instancias onde estas,  receberam a tag da da ultima versão com build com sucesso e via script de bootstrap, será realizado o download da versão em questão do Jfrog.

Para novas versões ou ajustes no Banco de dados, foi escolhido utilizar o Jenkins e o LiquidBase para controla e permitir o controle dos deploys para a parte de banco de dados.
=======
Projeto SRE

Foi utilizado o terraform para provisionar na AWS a parte de infra conforme abaixo:

Uma maquina de controle -- Instancia EC2
terraform-aws-ec2-controlmaster -- Diretório com scripts do Terraform (Em andamento)
 Objetivo da máquina:
  Jenkins para controle das pipelines de deploy (Dev, Hom e Prd). Além de pipelines de controle de Infra (Disparar comandos -> terraform init, destroy,etc)
  Prometheus e Grafana
  Ansible (Para parte de configuração das máquinas -- Em andamento)

Ambientes de Desenvolvimento, Homologação e Produção:

Foi implementado um projeto no Terraform com nome s3. Seu objetivo é de utilizar AWS S3 para guardar os arquivos TFstate do terraform de forma segura, além do S3 está sendo utilizo um Dynamodb para guardar o ID do TFstates. Esta mesma estrutura pode ser utilizado por vários outros projetos.

Foi implementado um projeto no Terraform com nome terraform_projetosre_v1. Seu objetivo é automatizar a administração dos ambientes de desenvolvimento, homologação e produção. O mesmo foi construído para implementar um Cluster de maquinas EC2 com auto scalling e implementando um loadbalance utilizando o AWS ALB, essa estrutura para atendar a aplicação, além disso o script foi implementado de forma a ter reaproveitamento onde temos módulos com funções genéricas para todos os ambientes e projetos principais que utilizam os módulos segmentados por ambiente. Fora isso para a configuração do Auto scalling, foi implementado um redução de capacidade para madrugada. Para parte de banco de dados, foi implementado scripts para implementação de do Banco Postgres 14, utilizando o AWS RDS, onde para homologação de produção é possível subir instancia do banco com réplica, além da configuração para backup automático entre as 00 e as 03 da manha.

Em relação a parte de deploy, foi configurado no projeto do Terraform, para parte da aplicação, a estratégia de deploy Rolling deploy. 
Em relação ao fluxo de deploy da aplicação, foi pensado na estratégia abaixo:
 
 * Ao ser commitada uma nova versão no GIT da aplicação é disparada via webhook a pipeline do respetivo ambiente (considerando a branch na qual o commit foi realizado)
 * A ideia é que localmente, seja realizado a build do projeto dentro de uma imagem docker, onde os testes unitários seriam executados junto com a build. E teríamos um projeto apartado contendo os testes de integração e E2E, onde o bando de homologação seria utilizado. 
 
 
# Configurar credenciais AWS
export AWS_SECRET_ACCESS_KEY=

export AWS_ACCESS_KEY_ID=

export AWS_DEFAULT_REGION=

# Configurar conta GIT
 git config --global user.email "asd@email.com"
 
 git config --global user.name "usuariogit"

 # Clonar projeto de Infra do GIT
 git clone https://@github.com/tspcruz/projsre.git](https://github.com/tspcruz/projetosre.git)

