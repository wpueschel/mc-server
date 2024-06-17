# Public IP of the VM
output "public_ip_address" {
  value = azurerm_public_ip.pub_ip.ip_address
}

# File outputs
resource "local_file" "private_key" {
  content = tls_private_key.ssh_key.private_key_openssh
  filename = "id_rsa"
  file_permission = "0600"
}

resource "local_file" "ansible_inventory" {
  content = format("%s\n%s", "[minecraft_server]", azurerm_public_ip.pub_ip.ip_address) 
  filename = "hosts"
  file_permission = "0644"
}
