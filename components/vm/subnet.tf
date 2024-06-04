resource "azurerm_subnet" "subnet" {
  name                 = "vm-subnet"
  resource_group_name  = "ks-rg"
  virtual_network_name = "ks-vnet2"
  address_prefixes     = ["10.7.38.0/27"]
}
