resource "azurerm_virtual_network" "net" {
  depends_on            = [
    azurerm_resource_group.rg,
  ]
  name                = "minecraft"
  address_space       = [ var.net_range ]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  depends_on            = [
    azurerm_virtual_network.net,
  ]
  name                 = "minecraft-1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.net.name
  address_prefixes     = [ var.subnet_range ]
}

resource "azurerm_public_ip" "pub_ip" {
  name                = "minecraft"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  ip_version          = "IPv4"
}

resource "azurerm_network_interface" "interface" {
  depends_on            = [
    azurerm_subnet.subnet,
    azurerm_public_ip.pub_ip,
  ]
  name                = "minecraft"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "minecraft"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub_ip.id
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_netsecgroup" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.netsecgroup.id
}
