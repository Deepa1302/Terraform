variable ag_name{}
variable resource_group_name{}
variable location{}
variable "env" {}
# variable "sku_name" {}
# variable "sku_tier" {}
# variable "sku_capacity" {}
/*variable gateway_ip_configuration_name{}
variable frontend_id{}
variable frontend_ip_configuration_name{}
variable backend_address_pool_name{}
variable http_setting_name{}
variable listener_name{}
variable frontend_port_name{}
variable request_routing_rule_name{}
variable public_ip_address_id {}
*/
variable "applicationgateway_filepath" {}
variable "firewall_policy_id" {
default=null
}

variable "ag_tags" {
  default={}
}