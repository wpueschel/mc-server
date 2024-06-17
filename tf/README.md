# tf

This creates an Ubuntu VM with a public IP and an initial ssh key and an ansible host file. Connections will be allowed to the minecraft and ssh ports (25565/TCP and 22/TCP).

Variables that can be set:
- `location` to set the location, default: `westeuope`
- `rg_name` to change the name of the resource group in Azure that contains all the resources, default: `minecraft`
- `net_range` to set the network CIDR, default `192.168.0.0/16`
- `subnet_range` to set the subnetnet CIDR that will be attached to the VM, default `192.168.1.0/24`
- `vm_size` to set the VM size/flavour, default: `Standard_D2_v4`
- `server_name` to set the (host) name of the VM, defaulr `minecraft`

These vars can be set in a tfvars file, on the command line or via env variables. The defaults will work fine in most cases.

Login to your Azure account via az cli (`az login`), set the subscrioption you want to use with `az account set --subscription <your subscription name>` then run:
```
terraform init
terraform apply
```
This will create the resources and the initial ssh key (file: `id_rsa`) and an Ansible inventory file (`hosts`). When the terraform run finished, it will output the public IP address. You can now connect to the machine with `ssh -i id_rsa ubuntu@<public ip address>`.

