variable "rou_name" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the route. Changing this forces a new resource to be created."
  type        = string
}
variable "udr_name" {
  description = "(Required) The name of the route table within which create the route. Changing this forces a new resource to be created."
  type        = string
}
variable "rou_address_prefix" {
  description = "(Required) The destination CIDR to which the route applies, such as 10.1.0.0/16."
  type        = string
}
variable "rou_hop_type" {
  default     = "None"
  description = "(Required) The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None."
  type        = string
}
variable "rou_hop_ip" {
  default     = null
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
}
