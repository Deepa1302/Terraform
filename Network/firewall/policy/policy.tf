resource "azurerm_firewall_policy" "policy" {
  name                = var.policy_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku_tier
  #tags                = var.tags_FWP

  dns {
    proxy_enabled = var.proxy_enabled
    servers       = var.dns_servers
  }
  /* identity {
    type = "UserAssigned"
    user_assigned_identity_ids = var.user_assigned_identity_ids
  }

 
 tls_certificate {
    key_vault_secret_id   = var.kv_id
    name                  = var.kv_secret_name
  }

  intrusion_detection {
    mode                  = var.idps_mode
  } 

  threat_intelligence_mode {
    mode                  = var.threat_intelligence_mode
  }*/

}