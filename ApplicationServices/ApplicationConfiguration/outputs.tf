output "appconf_id" {
  description = "The App Configuration ID."
  value       = azurerm_app_configuration.appconf.id 
}
output "appconf_name" {
  description = "The name of the App Configuration."
  value       = azurerm_app_configuration.appconf.name
}
output "location" {
  value = azurerm_app_configuration.appconf.location
}