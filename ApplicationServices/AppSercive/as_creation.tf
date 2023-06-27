resource "azurerm_app_service" "application_service" {
  name                = var.as_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  site_config {
    dotnet_framework_version      = var.as_dotnet_framework_version
    scm_type = var.as_scm_type
  }
  app_settings = {
    "SOME_KEY" = "value"
  }
  dynamic "connection_string" {
    for_each = var.ob_connection_string == null ? [] : var.ob_connection_string
    content {
      name = ob_connection_string.value.as_conn_name
      type = ob_connection_string.value.as_conn_type
      value = ob_connection_string.value.as_conn_value
    }
  }
  tags                         = var.tags_AS
}
