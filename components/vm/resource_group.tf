resource "azurerm_resource_group" "rg" {
  name     = "terraform-kt-rg"
  location = "uk south"
  tags     = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
