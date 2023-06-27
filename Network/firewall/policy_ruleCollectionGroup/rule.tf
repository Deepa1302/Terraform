locals { 
  #network_collection_rules = csvdecode(file("${path.module}/network_collection_rules.csv"))
  #app_collection_rules     = csvdecode(file("${path.module}/app_collection_rules.csv"))
  #ncrs_outbound = csvdecode(file("${path.module}/network_collectionrules_outbound.csv"))

  # network_collection_rules  = csvdecode(var.network_collection_rules_csv)
  app_collection_rules        = csvdecode(var.app_collection_rules_csv)
  app_collection_rules_deny   = csvdecode(var.app_collection_rules_deny_csv)
  ncrs_allow                  = csvdecode(var.network_collectionrules_allow_csv)
  ncrs_deny                   = csvdecode(var.network_collectionrules_deny_csv)
  # nat_collection_rules      = csvdecode(var.nat_collection_rules_csv)
}

resource "azurerm_firewall_policy_rule_collection_group" "policy_rule" {
  name               = var.policyRuleCollectionGroup_name
  firewall_policy_id = var.firewall_policy_id
  priority           = var.priority_rcg           //rcg=rulecollectiongroup ::The range is 100-65000.
  
   application_rule_collection {
      name     = var.appRuleCollection_name
      priority = var.priority_arcg                 //arcg=applicationrulecollectiongroup::The range is 100-65000.
      action   = var.action_arcg                       //Possible values are Allow and Deny
      dynamic "rule" {
        for_each = local.app_collection_rules
        content{
        name = rule.value.rule_arcg_name                      // rule name
          protocols {                               //Not required when specifying destination_fqdn_tags, but required when specifying destination_fqdns
            type = rule.value.type1
            port = rule.value.port1
          }
          # protocols {                               //Not required when specifying destination_fqdn_tags, but required when specifying destination_fqdns
          #   type = rule.value.type2
          #   port = rule.value.port2
          # }
         terminate_tls        = false 
        source_ip_groups      = split(":",rule.value.source_ip_groups)             //CIDR and *
        destination_addresses  = rule.value.destination_addresses_arcg != "" ? split(":",rule.value.destination_addresses_arcg) : null
        destination_fqdns     = rule.value.destination_fqdns_arcg != "" ? split(":",rule.value.destination_fqdns_arcg) : null             // Conflicts with destination_urls.
        # destination_urls      = rule.value.destination_urls_arcg != "" ? split(":",rule.value.destination_urls_arcg) : null               // Conflicts with destination_fqdn.
        destination_fqdn_tags = rule.value.destination_fqdn_tags_arcg != "" ? split(":",rule.value.destination_fqdn_tags_arcg) : null  
        web_categories        = rule.value.web_categories != "" ? split(":",rule.value.web_categories) : null  
       }
    }
  }

     application_rule_collection {
      name     = var.appRuleCollection_name_deny
      priority = var.priority_arcg_deny                //arcg=applicationrulecollectiongroup::The range is 100-65000.
      action   = var.action_arcg_deny                       //Possible values are Allow and Deny
      dynamic "rule" {
        for_each = local.app_collection_rules_deny
        content{
        name = rule.value.rule_arcg_name                      // rule name
          protocols {                               //Not required when specifying destination_fqdn_tags, but required when specifying destination_fqdns
            type = rule.value.type1
            port = rule.value.port1
          }
          # protocols {                               //Not required when specifying destination_fqdn_tags, but required when specifying destination_fqdns
          #   type = rule.value.type2
          #   port = rule.value.port2
          # }
          terminate_tls        = false 
        source_ip_groups      = split(":",rule.value.source_ip_groups)             //CIDR and *
        destination_fqdns     = rule.value.destination_fqdns_arcg != "" ? split(":",rule.value.destination_fqdns_arcg) : null             // Conflicts with destination_urls.
        # destination_urls      = rule.value.destination_urls_arcg != "" ? split(":",rule.value.destination_urls_arcg) : null               // Conflicts with destination_fqdn.
        # destination_fqdn_tags = rule.value.destination_fqdn_tags_arcg != "" ? split(":",rule.value.destination_fqdn_tags_arcg) : null  
        # web_categories        = rule.value.web_categories != "" ? split(":",rule.value.web_categories) : null  
       }
    }
  }
  
  
#  network_rule_collection {
#     //for_each = local.network_collection_rules
#     //for_each   = { for data in local.network_collection_rules : data.ID => data if data.Active }
#     name     = var.ntwrulecollection_name
#     priority = var.priority_nrcg
#     action   = var.action_nrcg
    
#    dynamic "rule" {
#         for_each = local.network_collection_rules  //"${var.foo}-suffix"
#          content{
#         name                  = rule.value.rule_nrcg_name
#         protocols             = split(":", rule.value.protocols_nrcg)        //Possible values are Any, TCP, UDP, ICMP.
#         //source_addresses      = split(":", rule.value.source_addresses_nrcg)
#         source_ip_groups      = split(":",rule.value.source_ip_groups)
#         destination_addresses = rule.value.destination_addresses_nrcg != "" ?split(":", rule.value.destination_addresses_nrcg):null //["192.168.1.1", "192.168.1.2"]
#         destination_ip_groups = rule.value.destination_ip_groups != "" ?split(":",rule.value.destination_ip_groups):null
#         destination_ports     = split(":", rule.value.destination_ports_nrcg )     //["80", "1000-2000"]
#         destination_fqdns     = rule.value.destination_fqdns_nrcg != "" ?split(":", rule.value.destination_fqdns_nrcg):null
        
#     }
#    }
#   }
  network_rule_collection {
    //for_each = local.network_collection_rules
    //for_each   = { for data in local.network_collection_rules : data.ID => data if data.Active }
    name     = var.ntwrulecollection_name_allow
    priority = var.priority_nrcg_allow
    action   = var.action_nrcg_allow
    
   dynamic "rule" {
        for_each = local.ncrs_allow  //"${var.foo}-suffix"
        content{
          name                  = rule.value.rule_nrcg_name
          protocols             = split(":", rule.value.protocols_nrcg)        //Possible values are Any, TCP, UDP, ICMP.
          #source_addresses      = split(":", rule.value.source_addresses_nrcg)
          source_ip_groups      = split(":",rule.value.source_ip_groups)
          destination_addresses = rule.value.destination_addresses_nrcg != "" ?split(":", rule.value.destination_addresses_nrcg):null //["192.168.1.1", "192.168.1.2"]
          destination_ip_groups = rule.value.destination_ip_groups != "" ?split(":",rule.value.destination_ip_groups):null
          destination_ports     = split(":", rule.value.destination_ports_nrcg )     //["80", "1000-2000"]
          destination_fqdns     = rule.value.destination_fqdns_nrcg != "" ?split(":", rule.value.destination_fqdns_nrcg):null
          
    }
  }
  }
  network_rule_collection {
    //for_each = local.network_collection_rules
    //for_each   = { for data in local.network_collection_rules : data.ID => data if data.Active }
    name     = var.ntwrulecollection_name_deny
    priority = var.priority_nrcg_deny
    action   = var.action_nrcg_deny
    
   dynamic "rule" {
        for_each = local.ncrs_deny  //"${var.foo}-suffix"
        content{
          name                  = rule.value.rule_nrcg_name
          protocols             = split(":", rule.value.protocols_nrcg)        //Possible values are Any, TCP, UDP, ICMP.
          //source_addresses      = rule.value.source_addresses_nrcg != "" ?split(":", rule.value.source_addresses_nrcg):null
          source_ip_groups      = rule.value.source_ip_groups != "" ?split(":",rule.value.source_ip_groups):null
          destination_addresses = rule.value.destination_addresses_nrcg != "" ?split(":", rule.value.destination_addresses_nrcg):null //["192.168.1.1", "192.168.1.2"]
          destination_ip_groups = rule.value.destination_ip_groups != "" ?split(":",rule.value.destination_ip_groups):null
          destination_ports     = split(":", rule.value.destination_ports_nrcg )     //["80", "1000-2000"]
          destination_fqdns     = rule.value.destination_fqdns_nrcg != "" ?split(":", rule.value.destination_fqdns_nrcg):null
          
    }
  }
  }
#   network_rule_collection {
#     //for_each = local.network_collection_rules
#     //for_each   = { for data in local.network_collection_rules : data.ID => data if data.Active }
#     name     = var.ntwrulecollection_name_default
#     priority = var.priority_nrcg_default
#     action   = var.action_nrcg_default
    
#     rule {
#       name                  = "default_deny"
#       protocols             = ["Any"]
#       source_addresses      = ["*"]
#       destination_addresses = ["*"]
#       destination_ports     = ["*"]
#   }
#   }
#    nat_rule_collection {
#     //for_each = local.nat_collection_rules
#     //for_each   = { for data in local.nat_collection_rules : data.ID => data if data.Active }
#     name     = var.natrulecollection_name
#     priority = var.priority_natrcg
#     action   = var.action_natrcg
    
#    dynamic "rule" {
#         for_each = local.nat_collection_rules  //"${var.foo}-suffix"
#          content{
#         name                  = rule.value.rule_natrcg_name
#         protocols             = split(":", rule.value.protocols_natrcg)        //Possible values are Any, TCP, UDP, ICMP.
#         //source_addresses      = split(":", rule.value.source_addresses_natrcg)
#         source_ip_groups      = split(":",rule.value.source_ip_groups)
#         destination_address = rule.value.destination_address_natrcg != "" ?split(":", rule.value.destination_address_natrcg):null //["192.168.1.1", "192.168.1.2"]
#         destination_ip_groups = rule.value.destination_ip_groups != "" ?split(":",rule.value.destination_ip_groups):null
#         destination_ports     = split(":", rule.value.destination_ports_natrcg )     //["80", "1000-2000"]
#         destination_fqdns     = rule.value.destination_fqdns_natrcg != "" ?split(":", rule.value.destination_fqdns_natrcg):null
#         translated_address    = rule.value.translated_address_natrcg != "" ?split(":", rule.value.translated_address_natrcg):null
#         translated_port       = split(":", rule.value.translated_port_natrcg )
#     }
#    }
#   }
#   nat_rule_collection {
#     //for_each = local.nat_collection_rules
#     //for_each   = { for data in local.nat_collection_rules : data.ID => data if data.Active }
#     name     = var.natrulecollection_name_default
#     priority = var.priority_natrcg_default
#     action   = var.action_natrcg_default
    
#     rule {
#       name                  = "nat_default_deny"
#       protocols             = ["Any"]
#       source_addresses      = ["*"]
#       destination_address   = ["*"]
#       destination_ports     = ["*"]
#       translated_address    = ["*"]
#       translated_port       = ["*"]
#   }
# }
}
