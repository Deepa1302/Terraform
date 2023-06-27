output "asp_id" {
  description = "The ID of the App Service Plan component."
  value       = azurerm_app_service_plan.application_service_plan.id
}
output "asp_maximum_number_of_workers" {
  description = "The maximum number of workers supported with the App Service Plan's sku."
  value       = azurerm_app_service_plan.application_service_plan.maximum_number_of_workers
}
