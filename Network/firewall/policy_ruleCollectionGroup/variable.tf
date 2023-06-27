variable "policyRuleCollectionGroup_name"{}
variable "firewall_policy_id"{}
variable "priority_rcg"{}

variable "appRuleCollection_name"{
  
}
variable "priority_arcg"{

}
variable "action_arcg"{

}

variable "appRuleCollection_name_deny"{
  
}
variable "priority_arcg_deny"{

}
variable "action_arcg_deny"{

}
/*
variable "rule_arcg_name"{
default=null}
variable "type"{
default=null}
variable "port"{
default=null}
variable "source_addresses_arcg"{
default=null}
variable "destination_fqdns_arcg"{
default=null}
variable "destination_urls_arcg"{
default=null}
variable "destination_fqdn_tags_arcg"{
default=null}
*/
# variable "ntwrulecollection_name"{
    
# }
# variable "priority_nrcg"{}
# variable "action_nrcg"{}


variable "ntwrulecollection_name_allow"{}
variable "priority_nrcg_allow"{}
variable "action_nrcg_allow"{}

# variable "rule_nrcg_name"{}
# variable "protocols_nrcg"{}
# variable "source_addresses_nrcg"{}
# variable "destination_addresses_nrcg"{}
# variable "destination_ports_nrcg"{}
# variable "destination_fqdns_nrcg"{}



# variable "network_collection_rules_csv" {
#   description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
# }
variable "app_collection_rules_csv" {
  description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
}

variable "app_collection_rules_deny_csv" {
  description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
}

variable "network_collectionrules_allow_csv" {
  description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
}
variable "network_collectionrules_deny_csv" {
  description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
}
# variable "nat_collection_rules_csv" {
#   description = "(Required) Custom variable to define the full file path of the file containing the data in a CSV format."
# }

# variable "network_collectionrules_inbound_csv" {}

variable "ntwrulecollection_name_deny"{}
variable "priority_nrcg_deny"{}
variable "action_nrcg_deny"{}

# variable "ntwrulecollection_name_default" {}
# variable "priority_nrcg_default" {}
# variable "action_nrcg_default" {}

# variable "natrulecollection_name"{
#     default=null
# }
#  variable "priority_natrcg"{}
#  variable "action_natrcg" {}


# variable "rule_natrcg_name"{}
# variable "protocols_natrcg"{}
# variable "source_addresses_natrcg"{}
# variable "destination_addresses_natrcg"{}
# variable "destination_ports_natrcg"{}
# variable "translated_address"{}
# variable "translated_port"{}

# variable "natrulecollection_name_default"{
#     default=null
# }
#  variable "priority_natrcg_default"{}
#  variable "action_natrcg_default" {}
