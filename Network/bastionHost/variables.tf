variable "bhs_name" {
  description = "(Required) Specifies the name of the Bastion Host. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Bastion Host."
  type        = string
}
variable "location" {
  description = " (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

// IP Configuration block: (Required) A ip_configuration block as defined below.
variable "bhs_ip_name" {
  description = "(Required) The name of the IP configuration."
  type        = string
}
variable "bhs_ip_subnet_id" {
  description = "(Required) Reference to a subnet in which this Bastion Host has been created."
  type        = string
}
variable "bhs_ip_pip_address_id" {
  description = "(Required) Reference to a Public IP Address to associate with this Bastion Host."
  type        = string
}

variable "tags_BHS" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
}
