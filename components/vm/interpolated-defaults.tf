resource "random_password" "vm_password" {
  length           = 16
  special          = true
  override_special = "#$%&@()_[]{}<>:?"
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1

}



locals {
  win_password  = random_password.vm_password.result
  lin_password  = random_password.vm_password.result
  windows       = "windows"
  linux         = "linux"
  expiresAfter  = "2024-06-10"
  os_type       = "windows"
  nessus_server = "nessus-scanners-nonprod000005.platform.hmcts.net"
  nessus_groups = "Nonprod-test"
  nessus_key    = "nessus-agent-key-nonprod"
}


# Azure Monitor

variable "azure_monitor_auto_upgrade_minor_version" {
  description = "Specifies if the platform deploys the latest minor version Azure Monitor update to the type_handler_version specified."
  type        = bool
  default     = true
}

variable "azure_monitor_type_handler_version" {
  description = "Version of Azure Monitor - To find: az vm extension image list --location uksouth -p Microsoft.Azure.Monitor -o table"
  type        = string
  default     = "1.9"
}

variable "azure_monitor_settings" {
  description = "The settings passed to the Azure Monitor extension, these are specified as a JSON object in a string."
  type        = string
  default     = null
}

variable "azure_monitor_protected_settings" {
  description = "The protected_settings passed to the Azure Monitor extension, like settings, these are specified as a JSON object in a string."
  type        = string
  default     = null
}


module "ctags" {
  source = "github.com:hmcts/terraform-module-common-tags?ref=master"

  builtFrom   = "github.com/hmcts/terraform-kt"
  environment = "sbox"
  product     = "mgmt"
}
