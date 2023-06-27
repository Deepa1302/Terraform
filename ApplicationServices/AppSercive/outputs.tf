output "as_id" {
  description = "The ID of the App Service."
  value       = azurerm_app_service.application_service.id
}
output "as_custom_domain_verification_id" {
  description = "An identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_app_service.application_service.custom_domain_verification_id
}
