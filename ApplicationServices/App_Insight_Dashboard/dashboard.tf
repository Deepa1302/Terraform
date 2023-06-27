
resource "azurerm_dashboard" "dashboard" {
  name                = var.dashboard_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  dashboard_properties = var.dashboard_properties
  /*templatefile("templates/search-statistics-dashboard.json", 
    {
      appinsight_instance     = "${var.appinsight_instance}"
      log_analytics_workspace = "${var.log_analytics_workspace}"
      resource_group          = "${var.resource_group}"
      subscription_id         = "${var.subscription_id}"
  })*/
}

