resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bhs_name
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                 = var.bhs_ip_name
    subnet_id            = var.bhs_ip_subnet_id
    public_ip_address_id = var.bhs_ip_pip_address_id
  }

  tags = var.tags_BHS
}
