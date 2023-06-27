resource "azurerm_app_service_plan" "application_service_plan" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier     = var.asp_sku_tier
    size     = var.asp_sku_size
    #capacity = var.asp_sku_capacity
  }

  #kind                         = var.asp_kind
  #maximum_elastic_worker_count = var.asp_maximum_elastic_worker_count
  #app_service_environment_id   = var.asp_app_service_environment_id
  #reserved                     = var.asp_reserved
  #per_site_scaling             = var.asp_per_site_scaling
  tags                         = var.tags_ASP
}
