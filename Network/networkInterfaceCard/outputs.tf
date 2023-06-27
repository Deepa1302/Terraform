output "nic_id" {
  description = "The ID of the Network Interface."
  value       = azurerm_network_interface.nic.id
}
output "nic_name" {
  description = "A name used for IP Configuration of NIC."
  value       = azurerm_network_interface.nic.name
}
output "nic_mac" {
  description = "The Media Access Control (MAC) Address of the Network Interface."
  value       = azurerm_network_interface.nic.mac_address
}
output "nic_vm_id" {
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
  value       = azurerm_network_interface.nic.virtual_machine_id
}

output  "nic_configip_names" {
  description	= "A name used for this IP Configuration."
  value 	    = azurerm_network_interface.nic.ip_configuration.*.name
}
