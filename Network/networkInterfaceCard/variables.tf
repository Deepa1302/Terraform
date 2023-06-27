variable "nic_name" {
  description = "(Required) The name of the Network Interface. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) The location where the Network Interface should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which to create the Network Interface. Changing this forces a new resource to be created."
  type        = string
}
variable "nic_dns_servers" {
  default     = []
  description = "(Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface.\nNote: Configuring DNS Servers on the Network Interface will override the DNS Servers defined on the Virtual Network."
  type        = list(string)
}
variable "nic_enable_ip_forwarding" {
  default     = null
  description = "(Optional) Should IP Forwarding be enabled? Defaults to false."
  type        = bool
}
variable "nic_enable_accelerated_networking" {
  default     = null
  description = "(Optional) Should Accelerated Networking be enabled? Defaults to false.\nNote:\n\t(1) Only certain Virtual Machine sizes are supported for Accelerated Networking\n\t(2) To use Accelerated Networking in an Availability Set, the Availability Set must be deployed onto an Accelerated Networking enabled cluster."
  type        = bool
}
variable "nic_internal_dns_name_label" {
  default     = null
  description = "(Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
}
variable "tags_NIC" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
}
/* variable "nic_config_ips" {
  /*
    ip_configuration Block: (Required) One or more ip_configuration blocks as defined below.
      name                          : (Required) A name used for this IP Configuration.
      subnet_id                     : (Optional) The ID of the Subnet where this Network Interface should be located in.
      private_ip_address_version    : (Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4.
      private_ip_address            : (Optional) The Static IP Address which should be used.
      private_ip_address_allocation : (Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
      public_ip_address_id          : (Optional) Reference to a Public IP Address to associate with this NIC
      primary                       : (Optional) Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false.
  */
  /* description = "(Required) A custom object variable for IP Configurations."
  type = list(object({
    name                          = string
    subnet_id                     = string
    private_ip_address_version    = string
    private_ip_address            = string
    private_ip_address_allocation = string
    public_ip_address_id          = string
    primary                       = bool
  }))
}
*/
variable "vm_ip_config_name" {
  description = "Name of the ip configration for nic"
}
variable "vm_ip_address_allocation" {
  description = "ip address alllocation for Nic"
}

variable "subnet_id" {
 description = " The ID of the Subnet"
}
variable "vm_private_ip_address" {
type = string
default = ""
}
variable "publicip_id" {

  description = "Public ip Id"  
}
variable "is_vm_public_ip_needed" {
}

