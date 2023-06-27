variable "asp_name" {
  description = "(Required) Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = " (Required) Specifies the supported Azure location where the resource exists."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the App Service Plan component."
  type        = string
}
# default     = null
 # description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows."
  #type        = string
#}
#variable "asp_maximum_elastic_worker_count" {
#  default     = null
 # description = "(Optional) The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  #type        = number
#}
 #variable "asp_app_service_environment_id" {
  #default     = null
  #description = "(Optional) The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created."
  #type        = string
#}
#variable "asp_reserved" {
#  default     = null
#  description = "(Optional) Is this App Service Plan Reserved. Defaults to false."
#  type        = string
#}
#variable "asp_per_site_scaling" {
#  default     = null
#  description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
#  type        = string
#}
variable "tags_ASP" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
}
//SKU Block: (Required) A sku block for the App Service Plan as documented below.
variable "asp_sku_tier" {
  description = "(Required) Specifies the plan's pricing tier."
  type        = string
}
variable "asp_sku_size" {
  description = "(Required) Specifies the plan's instance size."
  type        = string
}
#variable "asp_sku_capacity" {
 # default     = null
  #description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  #type        = string
#}
