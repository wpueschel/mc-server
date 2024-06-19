# mc-server

This repo sets up a minecraft server in Azure. It uses Terraform and Ansible.

## Prerequsites
- Working Azure CLI installation and Azure subscription
- Working Terraform installation
- Working Ansible installation

## How to use

First run terraform from the tf directory (se the README in the tf directory for instructions). Once the machine is up and running, run the minecraft.yml playbook in the ansible directory (instructions in the README in the ansible directory).

tl;dr
```
# Log into your Azure subscription
az login
az acount-set --subscription <your subscription>
# Run terraform
cd tf
terraform init
terraform apply -auto-approve
# Check if machine is up
ssh -i id_rsa ubuntu@<public_ip_address> 
logout
# Run ansible
cd ../ansible
ansible-playbook minecraft.yml
```
Enjoy.
