output "id" {
  value = azurerm_user_assigned_identity.uai.id
}
output "uai_client_id" {
value = azurerm_user_assigned_identity.uai.client_id
}
output  "uai_principal_id"{
value = azurerm_user_assigned_identity.uai.principal_id
}
output "uai_tenant_id"{
value = azurerm_user_assigned_identity.uai.tenant_id
}

