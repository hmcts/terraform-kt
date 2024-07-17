# resource "azurerm_virtual_machine_extension" "azure_monitor_win" {
#   count = lower(local.windows) == "windows" ? 1 : 0

#   name                       = "AMAWindows"
#   virtual_machine_id         = module.vm_windows.vm_id
#   publisher                  = "Microsoft.Azure.Monitor"
#   type                       = "AzureMonitorWindowsAgent"
#   type_handler_version       = var.azure_monitor_type_handler_version
#   auto_upgrade_minor_version = var.azure_monitor_auto_upgrade_minor_version
#   settings                   = var.azure_monitor_settings
#   protected_settings         = var.azure_monitor_protected_settings

#   tags = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })

# }

