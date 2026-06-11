resource "azurerm_virtual_network" "ks_vnet" {
  name                = "ks-vnet2"
  resource_group_name = azurerm_resource_group.ks_rg.name
  location            = azurerm_resource_group.ks_rg.location
  address_space       = ["10.7.38.0/24"]
  tags                = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}