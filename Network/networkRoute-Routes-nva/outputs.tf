output "route_table_name" {
  description = "The name of the route table within which create the route."
  value       = azurerm_route.routes-nva.route_table_name
}
output "rou_id" {
  description = "The Route ID."
  value       = azurerm_route.routes-nva.id
}
