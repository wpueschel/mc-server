resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "minecraft_vm" {
  depends_on            = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.net,
    azurerm_subnet.subnet,
    azurerm_public_ip.pub_ip,
    azurerm_network_interface.interface,
    azurerm_network_security_group.netsecgroup,
    azurerm_subnet_network_security_group_association.subnet_netsecgroup,
  ]
  name                  = var.server_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [
    azurerm_network_interface.interface.id,
  ]
  size                  = var.vm_size

  os_disk {
    name                 = "OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = var.server_name
  admin_username                  = "ubuntu"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ubuntu"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }
}
