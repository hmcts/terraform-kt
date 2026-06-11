resource "azurerm_subnet" "subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.ks_rg.name
  virtual_network_name = azurerm_virtual_network.ks_vnet.name
  address_prefixes     = ["10.7.38.0/27"]
}
