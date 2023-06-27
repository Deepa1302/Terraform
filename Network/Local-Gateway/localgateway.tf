resource "azurerm_local_network_gateway" "local_network_gateway" {
  name                = var.local_network_gateway_name
  resource_group_name = var.rg_name
  location            = var.location
  gateway_address     = var.gateway_address
  address_space       = var.address_space
  tags                = var.tags
}