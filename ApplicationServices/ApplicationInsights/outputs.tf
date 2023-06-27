output "ais_instrumentation_key" {
  description = "The Instrumentation Key for this Application Insights component."
  value       = azurerm_application_insights.application_insights.instrumentation_key
}
output "ais_app_id" {
  description = "The App ID associated with this Application Insights component."
  value       = azurerm_application_insights.application_insights.app_id
}
output "ais_id" {
  description = "The Instrumentation Key for this Application Insights component."
  value       = azurerm_application_insights.application_insights.id
}
output "ais_connection_string" {
  description = "The Instrumentation Key for this Application Insights component."
  value       = azurerm_application_insights.application_insights.connection_string
}
output "ais_name" {
  description = "Name of the application Insight"
  value = azurerm_application_insights.application_insights.name
}
