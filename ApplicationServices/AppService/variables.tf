variable "as_name" {
  description = "(Required) Specifies the name of the App Service component. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = " (Required) Specifies the supported Azure location where the resource exists."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the App Service component."
  type        = string
}
variable "app_service_plan_id" {
  default     = null
  description = "(Required) The ID of the App Service Plan within which to create this App Service."
  type        = string
}
variable "tags_AS" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
}
//site config
variable "as_dotnet_framework_version" {
  default     = null
  description = "(Optional) The version of the .NET framework's CLR used in this App Service(v2.0,v4.0,v5.0,v6.0)."
  
}
variable "as_scm_type" {
  default     = null
  description = "(Optional) The type of Source Control enabled for this App Service. Defaults to None."
  type        = string
}
variable "number_of_workers" {
  description = "(Optional) The scaled number of workers (for per site scaling) of this App Service. Requires that per_site_scaling is enabled on the azurerm_app_service_plan."
}
variable "https_only" {
  description = "(Optional) Can the App Service only be accessed via HTTPS? Defaults to false."
}
/*connection_string- (Optional) One or more connection_string blocks as defined below.

as_conn_name-(Required) The name of the Connection String.
as_conn_type-(Required) The type of the Connection String. Possible values are APIHub, Custom, DocDb, EventHub, MySQL, NotificationHub, PostgreSQL, RedisCache, ServiceBus, SQLAzure and SQLServer.
as_conn_value-(Required) The value for the Connection String.
*/

#variable "ob_connection_string" {
#  default = []
#  description = "(Optional)"
#  type = list(object({
#    as_conn_name = string
#    as_conn_type = string
#    as_conn_value = string
#  }))
  
#}