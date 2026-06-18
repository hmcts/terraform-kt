resource "azurerm_resource_group" "ks_rg" {
  name     = var.resource_group_name
  location = "uksouth"

  tags = merge(local.common_tags, { expiresAfter = local.expiresAfter })
}
