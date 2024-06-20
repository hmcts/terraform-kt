module "vm_windows" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
  }
  source               = "github.com/hmcts/terraform-module-virtual-machine.git?ref=master"
  vm_type              = local.windows
  vm_name              = "win-test-vm"
  vm_resource_group    = azurerm_resource_group.rg.name
  vm_location          = azurerm_resource_group.rg.location
  vm_size              = "Standard_D8ds_v5"
  vm_admin_password    = local.win_password
  vm_availabilty_zones = "1"
  nic_name             = "nic-winvm"
  ipconfig_name        = "IP_CONFIGURATION"
  vm_subnet_id         = azurerm_subnet.subnet.id
  vm_private_ip        = "10.7.38.10"
  vm_public_ip_address = azurerm_public_ip.pubipt.id
  #storage_image_reference
  vm_publisher_name          = "microsoftwindowsdesktop"
  vm_offer                   = "windows-11"
  vm_sku                     = "win11-21h2-pro"
  vm_version                 = "latest"
  install_dynatrace_oneagent = false
  install_splunk_uf          = false
  nessus_install             = false
  env                        = "sbox"
  tags                       = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}

resource "azurerm_public_ip" "pubipt" {
  name                = "winpub_ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = ["1"]
  tags                = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
