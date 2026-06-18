resource "azurerm_virtual_network" "ks_vnet" {
  name                = "ks-vnet2"
  address_space       = ["10.7.38.0/24"]
  location            = azurerm_resource_group.ks_rg.location
  resource_group_name = azurerm_resource_group.ks_rg.name

  tags = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
