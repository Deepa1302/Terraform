locals {
  application_gateway = csvdecode(var.applicationgateway_filepath)
}
resource "azurerm_application_gateway" "network" {
  name                = var.ag_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.ag_tags
 firewall_policy_id   = var.firewall_policy_id
 

 lifecycle {
    ignore_changes = [
      tags, backend_address_pool, backend_http_settings, frontend_port, http_listener, request_routing_rule, probe, ssl_certificate
    ]
  }
  dynamic "sku" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
    content {
    name     = sku.value.sku_name // "WAF_v2"
    tier     = sku.value.sku_tier // "WAF_v2"
    capacity = sku.value.sku_capacity // 2

    # name     = var.sku_name // "WAF_v2"
    # tier     = var.sku_tier // "WAF_v2"
    # capacity = var.sku_capacity
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
    content {
    name      = gateway_ip_configuration.value.GIP_name //var.gateway_ip_configuration_name
    subnet_id = gateway_ip_configuration.value.GIP_subnet_id // var.frontend_id
    }
  }
   dynamic "frontend_port" {
     for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {
    name = frontend_port.value.FP_name //var.frontend_port_name
    port = frontend_port.value.FP_port//80
    }
   }

  dynamic "frontend_ip_configuration" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {

    name                 = frontend_ip_configuration.value.FIP_name //var.frontend_ip_configuration_name
    # subnet_id=frontend_ip_configuration.value.GIP_subnet_id ==""?null:frontend_ip_configuration.value.GIP_subnet_id
    public_ip_address_id = frontend_ip_configuration.value.FIP_public_ip_address_id ==""?null:frontend_ip_configuration.value.FIP_public_ip_address_id //var.public_ip_address_id, can be null
    # private_ip_address   = frontend_ip_configuration.value.FIP_private_ip_adddress ==""?null:frontend_ip_configuration.value.FIP_private_ip_adddress //can be null */
    # private_ip_address_allocation = "Static"
    
  }
  }
  dynamic "backend_address_pool" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {
    name = backend_address_pool.value.BAP_name //var.backend_address_pool_name
  }
  }
  dynamic "backend_http_settings" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {
    name                  = backend_http_settings.value.BHS_name //var.http_setting_name
    cookie_based_affinity = backend_http_settings.value.BHS_cookie_based_affinity//"Disabled"
    port                  = backend_http_settings.value.BHS_port//80
    protocol              = backend_http_settings.value.BHS_protocol//"Http"
    request_timeout       = backend_http_settings.value.BHS_request_timeout //1
    }
  }
  dynamic "http_listener" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {
    name                           = http_listener.value.HL_name //var.listener_name
    frontend_ip_configuration_name = http_listener.value.HL_frontend_ip_configuration_name //var.frontend_ip_configuration_name
    frontend_port_name             = http_listener.value.HL_frontend_port_name //var.frontend_port_name
    protocol                       = http_listener.value.HL_protocol  //"Http"
   }
  }
  dynamic "request_routing_rule" {
    for_each = { for data in local.application_gateway : data.ref_name => data if (data.env==var.env)} 
     content {
    priority=request_routing_rule.value.RR_priority
    name                       = request_routing_rule.value.RR_name //var.request_routing_rule_name
    rule_type                  = request_routing_rule.value.RR_rule_type //"Basic"
    http_listener_name         = request_routing_rule.value.HL_name //var.listener_name
    backend_address_pool_name  = request_routing_rule.value.RR_backend_address_pool_name //var.backend_address_pool_name
    backend_http_settings_name = request_routing_rule.value.RR_backend_http_settings_name //var.http_setting_name
    }
  }

}