output "sqldb_id" {
  description = "The ID of the MS SQL Database."
  value       = azurerm_mssql_database.mssqldb.id   
  }

output "sqldb_name" {
  description = "The name of the MS SQL Database."
  value       = azurerm_mssql_database.mssqldb.name    
  }