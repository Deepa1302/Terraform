resource "azurerm_application_insights" "application_insights" {
  name                                  = var.ais_name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  application_type                      = var.ais_type
  tags                                  = var.tags_AIS
}

