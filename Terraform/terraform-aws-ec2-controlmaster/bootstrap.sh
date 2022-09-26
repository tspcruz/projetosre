#!/bin/bash

# Apenas para deixar com horário Brasil GMT-3
cd /etc
rm -rf localtime
ln -s /usr/share/zoneinfo/Brazil/East localtime
clock -w
# Faz update do Linux
sudo apt-get update

# Criar pasta para terraform
#sudo mkdir /home/terraform
#sudo chown -R ubuntu:ubuntu /home/terraform
#sudo chmod 700 /home/terraform
#sudo mkdir /home/terraform/terraform-ec2-dev
#sudo chown -R ubuntu:ubuntu /home/terraform/terraform-ec2-dev
#sudo chmod 700 /home/terraform/terraform-ec2-dev


# Instalação expect
sudo apt-get -y install whois

# Instalação terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update

#sudo apt update
sudo apt-get -y install terraform

# Configuração usuário Ansible
sudo useradd ansible --create-home --home-dir /home/ansible -s /bin/bash -p $(mkpasswd --hash=SHA-512 pass123)
sudo usermod -a -G sudo ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
sudo su - ansible
sudo mkdir /home/ansible/.ssh
sudo cp -ar /home/ubuntu/.ssh/ /home/ansible/
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo chmod 700 /home/ansible/.ssh
sudo chmod 600 /home/ansible/.ssh/authorized_keys

sudo mkdir /home/ansible/controlproj/dockerimages
sudo mkdir /home/ansible/controlproj/dev
sudo mkdir /home/ansible/controlproj/hom
sudo mkdir /home/ansible/controlproj/prd
sudo chown -R ansible:ansible /home/ansible/controlproj/dockerimages
sudo chown -R ansible:ansible /home/ansible/controlproj/dockerimages/dev
sudo chown -R ansible:ansible /home/ansible/controlproj/dockerimages/hom
sudo chown -R ansible:ansible /home/ansible/controlproj/dockerimages/prd


# Cria diretório do Projeto
sudo mkdir /home/ansible/controlproj
sudo chown -R ansible:ansible  /home/ansible/controlproj


#sudo ssh-keygen -q -b 2048 -t rsa -f /home/ansible/.ssh/id_rsa -N ''
#sudo chmod 600 /home/ansible/.ssh/id_rsa
#sudo chmod 600 /home/ansible/.ssh/id_rsa.pub
sudo sed -i "s/^PasswordAuthentication yes$/PasswordAuthentication no/" /etc/ssh/sshd_config 
sudo service sshd restart

# Instalação Ansible Nmap e expect
sudo apt-get install -y nmap
sudo apt-get -y install expect

# Instalação Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get install -y ansible
sudo chown ansible:ansible /etc/ansible/ -R

# Instalação Python e AWS Cli
sudo pip3 install --upgrade pip
sudo pip install -U urllib3 requests
sudo pip3 install boto3 botocore
sudo pip3 install awsebcli --upgrade
sudo pip3 install --upgrade awscli
sudo apt-get install -y awscli
sudo apt-get install -y software-properties-common

# Instalação docker e docker python
sudo apt-get install -y docker python-docker-py
sudo apt-get install -y docker.io

# Instalação Terragrunt
sudo snap install terragrunt

# Muda o hostname da máquina
sudo hostnamectl set-hostname controlMaster
echo "controlMaster" > /etc/hostname

# reinicia
#shutdown -r now

