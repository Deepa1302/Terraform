variable "appconf_name" {
  description = "(Required) The name of the App Configuration. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) The location/region where the App Configuration is created. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the App Configuration."
  type        = string
}
variable "sku_name" {
  description   = "(Optional) Specifies the Sku of the App Configuration. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, and PerGB2018 (new Sku as of 2018-04-03). Defaults to PerGB2018."
  default       = "null"
  type          = string
}
variable "local_auth_enabled" {
  description  = "(Optional) Whether local authentication methods is enabled. Defaults to true."
  default      = "null"
  type         = string
}
variable "public_network_access" {
  description  = "(Optional) The Public Network Access setting of the App Configuration. Possible values are Enabled and Disabled."
  default      = "null"
  type         = string
}
variable "purge_protection_enabled" {
  description  = "(Optional) Whether Purge Protection is enabled. This field only works for standard sku. Defaults to false."
  default      = "null"
  type         = string
}
variable "soft_delete_retention_days" {
  description  = "(Optional) The number of days that items should be retained for once soft-deleted. This field only works for standard sku. This value can be between 1 and 7 days. Defaults to 7. Changing this forces a new resource to be created."
  default      = "null"
  type         = string
}
variable "identity" {
  description  = "(Required) Specifies the type of Managed Service Identity that should be configured on this App Configuration. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
  default      = "null"
  type         = string
}
variable "tags" {
   description = "(Optional) A mapping of tags which should be assigned to the App Configuration."
   default     = "null"
   type        = map(string)
 }