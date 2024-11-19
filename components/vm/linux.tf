
data "azurerm_storage_account" "xdr_storage" {
  provider            = azurerm.DTS-CFTPTL-INTSVC
  name                = "cftptlintsvc"
  resource_group_name = "core-infra-intsvc-rg"
}

# RHEL7
module "vm_rhel7" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
    azurerm.dcr = azurerm.dcr
  }
  source               = "github.com/hmcts/terraform-module-virtual-machine.git?ref=DTSPO-22154-availability_set"
  vm_type              = local.linux
  vm_name              = "rhel7-test-vm"
  vm_resource_group    = azurerm_resource_group.rg.name
  vm_location          = azurerm_resource_group.rg.location
  vm_size              = "Standard_D2ds_v5"
  vm_admin_password    = local.lin_password
  nic_name             = "nic-rhel7"
  ipconfig_name        = "IP_CONFIGURATION"
  vm_subnet_id         = azurerm_subnet.subnet.id
  vm_private_ip        = "10.7.38.20"
  vm_public_ip_address = azurerm_public_ip.pubipt_rhel7.id
  vm_availabilty_zones = null
  #storage_image_reference
  vm_publisher_name          = "RedHat"
  vm_offer                   = "RHEL"
  vm_sku                     = "7-LVM"
  vm_version                 = "latest"
  install_dynatrace_oneagent = false
  install_splunk_uf          = false
  nessus_install             = false
  env                        = "sbox"
  tags                       = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })


  run_command        = true
  run_command_sa_key = data.azurerm_storage_account.xdr_storage.primary_access_key
  run_xdr_collector  = false
  run_xdr_agent      = true
  rc_script_file     = ""
}

resource "azurerm_public_ip" "pubipt_rhel7" {
  name                = "pupipt_rhel7"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}
