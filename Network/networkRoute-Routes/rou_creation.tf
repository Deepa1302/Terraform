resource "azurerm_route" "add_routes" {
  name                   = var.rou_name
  resource_group_name    = var.resource_group_name
  route_table_name       = var.udr_name
  address_prefix         = var.rou_address_prefix
  next_hop_type          = var.rou_hop_type
  next_hop_in_ip_address = var.rou_hop_ip
}
