resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.sql_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.sql_administrator_login
  administrator_login_password = var.sql_administrator_login_password
  # minimum_tls_version          = var.sql_minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  tags                         = var.tags_SQL

  dynamic "azuread_administrator" {
    for_each = var.ob_azuread_administrator == null ? [] : var.ob_azuread_administrator
    content {
      login_username = azuread_administrator.value.login_username
      object_id      = azuread_administrator.value.object_id
      tenant_id      = azuread_administrator.value.tenant_id
    }
  }

  #dynamic "extended_auditing_policy" {
  #  for_each = var.ob_extended_auditing_policy == null ? [] : var.ob_extended_auditing_policy
  #  content {
  #    storage_endpoint                        = extended_auditing_policy.value.storage_endpoint
  #    storage_account_access_key              = extended_auditing_policy.value.storage_account_access_key
  #    storage_account_access_key_is_secondary = extended_auditing_policy.value.storage_account_access_key_is_secondary
  #    retention_in_days                       = extended_auditing_policy.value.retention_in_days
  #    log_monitoring_enabled                  = extended_auditing_policy.value.log_monitoring_enabled
  #  }
  #}

  dynamic "identity" {
    for_each = var.ob_identity == null ? [] : var.ob_identity
    content {
      type = identity.value.type
    }
  }

}
