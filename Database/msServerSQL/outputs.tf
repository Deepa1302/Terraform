output "sql_id" {
  description = "The Microsoft SQL Server ID."
  value       = azurerm_mssql_server.mssql_server.id
}
output "sql_fully_qualified_domain_name" {
  description = "The fully qualified domain name of the Azure SQL Server (e.g. myServerName.database.windows.net)"
  value       = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}
output "sql_restorable_dropped_database_ids" {
  description = "A list of dropped restorable database IDs on the server."
  value       = azurerm_mssql_server.mssql_server.restorable_dropped_database_ids
}
output "sql_principal_id" {
  description = "The Principal ID for the Service Principal associated with the Identity of this SQL Server."
  value       = azurerm_mssql_server.mssql_server.identity.*.principal_id
}
output "sql_tenant_id" {
  description = "The Tenant ID for the Service Principal associated with the Identity of this SQL Server."
  value       = azurerm_mssql_server.mssql_server.identity.*.tenant_id
}
