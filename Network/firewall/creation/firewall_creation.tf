resource "azurerm_firewall" "fw" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name 

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id   
    public_ip_address_id = var.public_ip_address_id
  }
 firewall_policy_id = var.firewall_policy_id
 
  sku_tier = var.sku_tier
  sku_name = var.sku_name
  tags = var.tags_FW
}