/*
locals { 
  webAppFirewallPolicy = csvdecode(var.webAppFirewallPolicy_FilePath)
}
*/
resource "azurerm_web_application_firewall_policy" "waf" {
  name                = var.wafPolicy_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.waf_tags  

    dynamic "custom_rules" {
      for_each = var.ob_custom_rules  //local.webAppFirewallPolicy
      content {
        name      = custom_rules.value.CustomRuleName
        priority  = custom_rules.value.Priority
        rule_type = custom_rules.value.RuleType

        match_conditions {
            match_variables {
                variable_name = custom_rules.value.MatchVariableName
            }
            operator           = custom_rules.value.Operator
            negation_condition = custom_rules.value.NegationCondition
            match_values       = custom_rules.value.MatchValues
        }
        action = custom_rules.value.Action
      }
    }

    dynamic "policy_settings" {
        for_each = var.ob_policy_settings  //local.webAppFirewallPolicy
        content {
            enabled                     = policy_settings.value.PolicyEnabled
            mode                        = policy_settings.value.Mode
          //  request_body_check          = policy_settings.value.RequestBodyCheck
            //file_upload_limit_in_mb     = policy_settings.value.FileLimit
          //  max_request_body_size_in_kb = policy_settings.value.Size
        }
    }

    dynamic "managed_rules" {
        for_each    =    var.ob_managed_rules //local.webAppFirewallPolicy
        content{
            /*            exclusion {
                match_variable          = managed_rules.value.MatchVariable
                selector                = managed_rules.value.Selector
                selector_match_operator = managed_rules.value.Operator
            }
            */
            managed_rule_set {
                type    = managed_rules.value.MRSType
                version = managed_rules.value.MRSVersion
                
                /*rule_group_override {
                    rule_group_name = managed_rules.value.RuleGroupName
                    disabled_rules = managed_rules.value.DiabledRules
                }
                */
            }
        }
    }
}