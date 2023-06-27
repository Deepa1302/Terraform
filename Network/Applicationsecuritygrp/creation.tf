resource "azurerm_application_security_group" "application_security_group" {

    name                = var.application_security_group_name
    resource_group_name = var.rg_name
    location            = var.location
    tags                = var.tags
}