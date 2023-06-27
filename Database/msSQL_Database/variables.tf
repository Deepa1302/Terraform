variable "TAGS_MSSQL_DB" {
  description = "(Optional) A mapping of tags to assign to the resource."
}

variable "mssql_database_name" {
  description = "(Required) The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "mssql_server_id" {
  description = "(Required) The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created."
}

variable "collation" {
  description = "(Optional) Specifies the collation of the database. Changing this forces a new resource to be created."
}

#variable "license_type" {
 # description = "(Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
#}

variable "max_size_gb" {
  description = "(Optional) The max size of the database in gigabytes."
}

variable "read_scale" {
  description = "(Optional) If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
}

variable "sku_name" {
  description = "(Optional) Specifies the name of the SKU used by the database."
}

variable "zone_redundant" {
  default = null
  description = "(Optional) Whether or not this database is zone redundant. This property is only settable for Premium and Business Critical databases."
}
variable "auto_pause_delay_in_minutes" {
  description = "(Optional) Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases."
}
variable "min_capacity" {
  description = "(Optional) Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases."
}
variable "ledger_enabled" {
  default = false
  description = "(Optional) A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created."
  type = string
}
