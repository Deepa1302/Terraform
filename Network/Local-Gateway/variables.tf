variable "local_network_gateway_name" {
  description="The name of the local network gateway. "
  type=string
}
variable "rg_name" {
  description="The name of the resource group in which to create the local network gateway."
  type=string  
}
variable "location" {
  description="he location/region where the local network gateway is created."
  type=string  
}
variable "gateway_address" {
  description="The IP address of the gateway to which to connect."
  type=string 
  
}

variable "address_space" {
  description="The list of string CIDRs representing the address spaces the gateway exposes."
  type=list(string) 
}

variable "tags" {
  description="A mapping of tags to assign to the resource."
  type=map(string)
}