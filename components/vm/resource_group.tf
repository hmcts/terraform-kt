resource "azurerm_resource_group" "ks_rg" {
  name     = "ks-rg"
  location = "uksouth"
  tags     = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
