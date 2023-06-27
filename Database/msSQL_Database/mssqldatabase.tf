
resource "azurerm_mssql_database" "mssqldb" {
  name           = var.mssql_database_name
  server_id      = var.mssql_server_id
  collation      = var.collation
  #license_type   = var.license_type
  max_size_gb    = var.max_size_gb
  read_scale     = var.read_scale
  sku_name       = var.sku_name
  zone_redundant = var.zone_redundant
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  min_capacity   = var.min_capacity
  ledger_enabled = var.ledger_enabled
  tags           = var.TAGS_MSSQL_DB
}