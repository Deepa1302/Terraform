output "bhs_id" {
  description = "The ID of the Bastion Host."
  value       = azurerm_bastion_host.bastion_host.id
}
output "bhs_fqdn" {
  description = "The FQDN for the Bastion Host."
  value       = azurerm_bastion_host.bastion_host.dns_name
}