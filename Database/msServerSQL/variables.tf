variable "sql_name" {
  description = "(Required) The name of the Microsoft SQL Server. This needs to be globally unique within Azure."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Microsoft SQL Server."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "sql_version" {
  default = "12.0"
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  # type        = number
  
}
variable "sql_administrator_login" {
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}
variable "sql_administrator_login_password" {
  description = "(Required) The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
  type        = string
}
# variable "sql_minimum_tls_version" {
#   description = "(Optional) The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2."
#   type        = number
# }
variable "public_network_access_enabled" {
  default = true
  description = "(Optional) Whether public network access is allowed for this server. Defaults to true."
}
variable "tags_SQL" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
}
//(Optional) A ob_azuread_administrator block as defined above.
/*
login_username : (Required) The login username of the Azure AD Administrator of this SQL Server.
object_id      : (Required) The object id of the Azure AD Administrator of this SQL Server.
tenant_id      : (Optional) The tenant id of the Azure AD Administrator of this SQL Server.
*/
variable "ob_azuread_administrator" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    login_username = string
    object_id      = string
    tenant_id      = string
  }))
}
//(Optional) A ob_extended_auditing_policy block as defined above.
/*
storage_account_access_key              : (Optional) Specifies the access key to use for the auditing storage account.
storage_endpoint                        : (Optional) Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net).
storage_account_access_key_is_secondary : (Optional) Specifies whether storage_account_access_key value is the storage's secondary key.
retention_in_days                       : (Optional) Specifies the number of days to retain logs for in the storage account.
log_monitoring_enabled                  : (Optional) Enable audit events to Azure Monitor? To enable server audit events to Azure Monitor, please enable its master database audit events to Azure Monitor.
*/
variable "ob_extended_auditing_policy" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_extended_auditing_policy' for for Storage Account."
  type = list(object({
    storage_endpoint                        = string
    storage_account_access_key              = string
    storage_account_access_key_is_secondary = bool
    retention_in_days                       = number
    log_monitoring_enabled                  = bool
  }))
}
//(Optional) A ob_identity block as defined above.
/*
  type - (Required) Specifies the identity type of the Microsoft SQL Server. At this time the only allowed value is SystemAssigned.
*/
variable "ob_identity" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_identity' for for Storage Account."
  type = list(object({
    type = string
  }))
}
