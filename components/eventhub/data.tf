resource "azurerm_resource_group" "ks_rg" {
  name     = var.resource_group_name
  location = "uksouth"

  tags = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
