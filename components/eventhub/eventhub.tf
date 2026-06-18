resource "azurerm_eventhub_namespace" "ks_eh_ns" {
  name                = "ks-eh-ns-test"
  resource_group_name = azurerm_resource_group.ks_rg.name
  location            = azurerm_resource_group.ks_rg.location
  sku                 = "Standard"
  capacity            = 1
  tags = merge(module.ctags.common_tags, { expiresAfter = local.expiresAfter })
}

resource "azurerm_eventhub" "ks_eh" {
  name                = "ks-eh-test"
  namespace_name      = azurerm_eventhub_namespace.ks_eh_ns.name
  resource_group_name = azurerm_resource_group.ks_rg.name
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_consumer_group" "bcdr_test_cg" {
  name                = "bcdr-test-cg"
  namespace_name      = azurerm_eventhub_namespace.ks_eh_ns.name
  eventhub_name       = azurerm_eventhub.ks_eh.name
  resource_group_name = azurerm_resource_group.ks_rg.name
}

# Authorization rule for send/listen (needed for BCDR testing)
resource "azurerm_eventhub_namespace_authorization_rule" "bcdr_test_rule" {
  name                = "bcdr-test-rule"
  namespace_name      = azurerm_eventhub_namespace.ks_eh_ns.name
  resource_group_name = azurerm_resource_group.ks_rg.name
  listen              = true
  send                = true
  manage              = false
}

# Outputs for BCDR testing
output "eventhub_namespace_id" {
  value = azurerm_eventhub_namespace.ks_eh_ns.id
}

output "eventhub_id" {
  value = azurerm_eventhub.ks_eh.id
}

output "eventhub_namespace_connection_string" {
  value     = azurerm_eventhub_namespace_authorization_rule.bcdr_test_rule.primary_connection_string
  sensitive = true
}

output "eventhub_connection_string" {
  value     = "${azurerm_eventhub_namespace_authorization_rule.bcdr_test_rule.primary_connection_string};EntityPath=${azurerm_eventhub.ks_eh.name}"
  sensitive = true
}