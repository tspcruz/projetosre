Gerar KeyPair na AWS para cada ambiente.

1 - acessar diretorio /home/ansible/controlproj/projsre/Ansible/playbooks
2 - executar o comando abaixo ajustando para o caminho do arquivo host_vars de acordo com o ambiente
 DEV:
 ansible-playbook -i ../inventories/dev/host ec2.key.yml
 HOM:
 ansible-playbook -i ../inventories/hom/host ec2.key.yml
 PRD:
 ansible-playbook -i ../inventories/prod/host ec2.key.yml

Deletar Keypair existente

1 - Comando para listar todas as Keypair existentes
 aws ec2 describe-key-pairs 
2 - executar o comando abaixo ajustando para o caminho do arquivo host_vars de acordo com o ambiente
 DEV:
 ansible-playbook -i ../inventories/dev/host ec2.key.delete.yml 
 HOM:
 ansible-playbook -i ../inventories/hom/host ec2.key.delete.yml 
 PRD:
 ansible-playbook -i ../inventories/prod/host ec2.key.delete.yml


Subir ambientes utilizando terraform


SSH para cluster da aplicacao

1 - Apos gerar as Keypair e os respetivos ambientes estiverem no ar utilizar os comandos abaixo:
 * Buscar IP da maquina master do cluster AWS asg.
 DEV:
 ssh -o StrictHostKeyChecking=no -i "~/controlproj/aws/dev_key.pem"  ansible@IP_NODE_MASTER_ASG
 HOM:
 ssh -o StrictHostKeyChecking=no -i "~/controlproj/aws/hom_key.pem"  ansible@IP_NODE_MASTER_ASG
 PRD:
 ssh -o StrictHostKeyChecking=no -i "~/controlproj/aws/prd_key.pem"  ansible@IP_NODE_MASTER_ASG