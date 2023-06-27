#  locals {
#   application_gateway = csvdecode(var.applicationgateway_filepath)
#    ssl_cert = base64encode(var.ssl_filepath)
#  }
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
    for_each = var.ob_sku == null ? [] : var.ob_sku
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
    for_each = var.ob_gateway_ip_configuration == null ? [] : var.ob_gateway_ip_configuration
    content {
    name      = gateway_ip_configuration.value.GIP_name //var.gateway_ip_configuration_name
    subnet_id = gateway_ip_configuration.value.GIP_subnet_id // var.frontend_id
    }
  }
  dynamic "ssl_certificate" {
    for_each = var.ob_ssl_certificate == null ? [] : var.ob_ssl_certificate
    content {
      name = ssl_certificate.value.ssl_name
      data = ssl_certificate.value.ssl_data
      password = ssl_certificate.value.ssl_password
    }
    
  }
   dynamic "frontend_port" {
     for_each = var.ob_frontend_port == null ? [] : var.ob_frontend_port
     content {
    name = frontend_port.value.FP_name //var.frontend_port_name
    port = frontend_port.value.FP_port//80
    }
   }

  dynamic "frontend_ip_configuration" {
    for_each = var.ob_frontend_ip_configuration == null ? [] : var.ob_frontend_ip_configuration
     content {

    name                 = frontend_ip_configuration.value.FIP_name //var.frontend_ip_configuration_name
    # subnet_id=frontend_ip_configuration.value.GIP_subnet_id ==""?null:frontend_ip_configuration.value.GIP_subnet_id
    public_ip_address_id = frontend_ip_configuration.value.FIP_public_ip_address_id ==""?null:frontend_ip_configuration.value.FIP_public_ip_address_id //var.public_ip_address_id, can be null
    # private_ip_address   = frontend_ip_configuration.value.FIP_private_ip_adddress ==""?null:frontend_ip_configuration.value.FIP_private_ip_adddress //can be null */
    # private_ip_address_allocation = "Static"
    
  }
  }
  dynamic "backend_address_pool" {
    for_each = var.ob_backend_address_pool == null ? [] : var.ob_backend_address_pool
     content {
    name = backend_address_pool.value.BAP_name //var.backend_address_pool_name
    fqdns = backend_address_pool.value.BAP_fqdns
  }
  }
  dynamic "backend_http_settings" {
    for_each = var.ob_backend_http_settings == null ? [] : var.ob_backend_http_settings
     content {
    name                  = backend_http_settings.value.BHS_name //var.http_setting_name
    cookie_based_affinity = backend_http_settings.value.BHS_cookie_based_affinity//"Disabled"
    port                  = backend_http_settings.value.BHS_port//80
    protocol              = backend_http_settings.value.BHS_protocol//"Http"
    request_timeout       = backend_http_settings.value.BHS_request_timeout //1
    }
  }
  dynamic "http_listener" {
    for_each = var.ob_http_listener == null ? [] : var.ob_http_listener
     content {
    name                           = http_listener.value.HL_name //var.listener_name
    frontend_ip_configuration_name = http_listener.value.HL_frontend_ip_configuration_name //var.frontend_ip_configuration_name
    frontend_port_name             = http_listener.value.HL_frontend_port_name //var.frontend_port_name
    protocol                       = http_listener.value.HL_protocol  //"Http"
    ssl_certificate_name           = http_listener.value.HL_ssl_name
   }
  }
  dynamic "request_routing_rule" {
    for_each = var.ob_request_routing_rule == null ? [] : var.ob_request_routing_rule
     content {
    priority                   = request_routing_rule.value.RR_priority
    name                       = request_routing_rule.value.RR_name //var.request_routing_rule_name
    rule_type                  = request_routing_rule.value.RR_rule_type //"Basic"
    http_listener_name         = request_routing_rule.value.RR_HL_name //var.listener_name
    backend_address_pool_name  = request_routing_rule.value.RR_backend_address_pool_name //var.backend_address_pool_name
    backend_http_settings_name = request_routing_rule.value.RR_backend_http_settings_name //var.http_setting_name
    }
  }

  dynamic "probe" {
    for_each = var.ob_probe == null ? [] : var.ob_probe
       content {
      name = probe.value.P_name
      protocol = probe.value.P_protocol
      interval = probe.value.P_interval
      path = probe.value.P_path
      timeout = probe.value.P_timeout
      unhealthy_threshold = probe.value.P_unhealthy_threshold
      pick_host_name_from_backend_http_settings = probe.value.P_pick_host_name_from_backend_http_settings
      minimum_servers = probe.value.P_minimum_servers
      match {
        status_code = probe.value.P_status_code
      }

    }
  }

}