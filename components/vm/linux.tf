
data "azurerm_storage_account" "xdr_storage" {
  provider            = azurerm.DTS-CFTPTL-INTSVC
  name                = "cftptlintsvc"
  resource_group_name = "core-infra-intsvc-rg"
}

# RHEL6
module "vm_rhel6" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
  }
  source               = "github.com/hmcts/terraform-module-virtual-machine.git?ref=bugfix-xdr-run-command-rhel6-azcopy"
  vm_type              = local.linux
  vm_name              = "rhel7-test-vm"
  vm_resource_group    = azurerm_resource_group.rg.name
  vm_location          = azurerm_resource_group.rg.location
  vm_size              = "Standard_D4ds_v5"
  vm_admin_password    = local.lin_password
  vm_availabilty_zones = "1"
  nic_name             = "nic-linvm"
  ipconfig_name        = "IP_CONFIGURATION"
  vm_subnet_id         = azurerm_subnet.subnet.id
  vm_private_ip        = "10.7.38.10"
  vm_public_ip_address = azurerm_public_ip.pubipt.id
  #storage_image_reference
  vm_publisher_name          = ""
  vm_offer                   = ""
  vm_sku                     = ""
  vm_version                 = ""
  custom_image_id            = "/subscriptions/9c604868-4643-43b8-9eb1-4c348c739a3e/resourceGroups/hmcts-images/providers/Microsoft.Compute/galleries/hmcts_images/images/hmcts-rhel-7.7/versions/0.5.0"
  install_dynatrace_oneagent = false
  install_splunk_uf          = false
  nessus_install             = false
  env                        = "sbox"
  tags                       = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })


  run_command        = false
  run_command_sa_key = data.azurerm_storage_account.xdr_storage.primary_access_key
  run_xdr_collector  = false
  run_xdr_agent      = false
  rc_script_file     = ""
}

resource "azurerm_public_ip" "pubipt" {
  name                = "linpub_ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = ["1"]
  tags                = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}


# Ubuntu 20.04
module "vm_ubu2004" {
  providers = {
    azurerm     = azurerm
    azurerm.cnp = azurerm.cnp
    azurerm.soc = azurerm.soc
  }
  source               = "github.com/hmcts/terraform-module-virtual-machine.git?ref=bugfix-xdr-run-command-rhel6-azcopy"
  vm_type              = local.linux
  vm_name              = "ubu2004-test-vm"
  vm_resource_group    = azurerm_resource_group.rg.name
  vm_location          = azurerm_resource_group.rg.location
  vm_size              = "Standard_D4ds_v5"
  vm_admin_password    = local.win_password
  vm_availabilty_zones = "1"
  nic_name             = "nic-linvm2"
  ipconfig_name        = "IP_CONFIGURATION"
  vm_subnet_id         = azurerm_subnet.subnet.id
  vm_private_ip        = "10.7.38.20"
  vm_public_ip_address = azurerm_public_ip.pubipt2.id
  #storage_image_reference
  vm_publisher_name          = "canonical"
  vm_offer                   = "0001-com-ubuntu-server-jammy"
  vm_sku                     = "22_04-lts-gen2"
  vm_version                 = "latest"
  install_dynatrace_oneagent = false
  install_splunk_uf          = false
  nessus_install             = false
  env                        = "sbox"
  tags                       = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })


  run_command        = false
  run_command_sa_key = data.azurerm_storage_account.xdr_storage.primary_access_key
  run_xdr_collector  = false
  run_xdr_agent      = false
  rc_script_file     = ""
}

resource "azurerm_public_ip" "pubipt2" {
  name                = "linpub_ip2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = ["1"]
  tags                = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}


resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.location

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "80.192.199.67"
    destination_address_prefix = "*"
  }
}