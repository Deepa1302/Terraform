resource "azurerm_app_configuration" "appconf" {
  name                               = var.appconf_name
  resource_group_name                = var.resource_group_name
  location                           = var.location
  sku_name                           = var.appconf_sku
  local_auth_enabled                 = var.appconf_local_auth_enabled
  public_network_access              = var.appconf_public_network_access
  purge_protection_enabled           = var.appconf_purge_protection_enabled
  soft_delete_retention_days         = var.appconf_soft_delete_retention_days
  identity                           = var.appconf_identity
  tags                               = var.tags
}
