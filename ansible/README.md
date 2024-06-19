# ansible

The minecraft.yml playbook sets up a mincraft server. 

It does some basic configuration (via the base\_setup role) and installs the Prometheus node\_exporter (via the node_exporter role) to be able to gather VM metrics via Prometheus. It creates systemd units for the node\_eporter and the minecraft server.

To run the playbook (once the vm has been created via terraform):

```
ansible-playbook minecraft.yml
```

The XMS/XMX values for the minecraft server can be set via the group vars (`ansible/inventory/group_vars`).

To check if the units are running, use systemd commands on the VM:
```
systemctl status minecraft
systemctl status node-exporter
```
