variable ag_name{}
variable resource_group_name{}
variable location{}
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
# variable "applicationgateway_filepath" {}
variable "firewall_policy_id" {
default=null
}
variable "ob_sku" {
  
}
variable "ob_gateway_ip_configuration" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    GIP_name           = string
    GIP_subnet_id      = string
  }))
}
variable "ob_ssl_certificate" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    ssl_name           = string
    ssl_data           = string
    ssl_password       = string
  }))
}
variable "ob_frontend_port" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    FP_name           = string
    FP_port      = string
  }))
}
variable "ob_frontend_ip_configuration" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    FIP_name           = string
    FIP_public_ip_address_id      = string
  }))
}
variable "ob_backend_address_pool" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    BAP_name           = string
    BAP_fqdns      = list(string)
  }))
}
variable "ob_backend_http_settings" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    BHS_name           = string
    BHS_cookie_based_affinity = string
    BHS_port       = string
    BHS_protocol = string
    BHS_request_timeout = string
  }))
}
variable "ob_http_listener" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    HL_name           = string
    HL_frontend_ip_configuration_name = string
    HL_frontend_port_name       = string
    HL_protocol = string
    HL_ssl_name = string
  }))
}
variable "ob_request_routing_rule" {
  default     = []
  description = "Custom object variable to configure optional block 'ob_azuread_administrator' for for Storage Account."
  type = list(object({
    RR_priority           = string
    RR_name = string
    RR_rule_type       = string
    RR_HL_name = string
    RR_backend_address_pool_name = string
    RR_backend_http_settings_name = string
  }))
}
variable "ob_probe" {
  default     = []
}
variable "ag_tags" {
  default={}
}