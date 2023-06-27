resource "azurerm_frontdoor_firewall_policy" "example" {
  name                              = var.frontdoorpolicy_name
  resource_group_name               = var.resource_group_name
  enabled                           = var.enabled
  mode                              = var.mode
  redirect_url                      = var.redirect_url
  custom_block_response_status_code = var.response_code
  custom_block_response_body        = var.response_body

  custom_rule {
    name                           = var.custom_rule
    enabled                        = var.enabled
    priority                       = var.priority
    rate_limit_duration_in_minutes = var.rate_duration
    rate_limit_threshold           = var.rate_threshold
    type                           = var.type
    action                         = var.action

    match_condition {
      match_variable     = var.match_variable
      operator           = var.operator
      negation_condition = var.negation_condition
      match_values       = var.match_values
    }
  }

  custom_rule {
    name                           = "Rule2"
    enabled                        = true
    priority                       = 2
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 10
    type                           = "MatchRule"
    action                         = "Block"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values       = ["192.168.1.0/24"]
    }

    match_condition {
      match_variable     = "RequestHeader"
      selector           = "UserAgent"
      operator           = "Contains"
      negation_condition = false
      match_values       = ["windows"]
      transforms         = ["Lowercase", "Trim"]
    }
  }

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    exclusion {
      match_variable = "QueryStringArgNames"
      operator       = "Equals"
      selector       = "not_suspicious"
    }

    override {
      rule_group_name = "PHP"

      rule {
        rule_id = "933100"
        enabled = false
        action  = "Block"
      }
    }

    override {
      rule_group_name = "SQLI"

      exclusion {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "really_not_suspicious"
      }

      rule {
        rule_id = "942200"
        action  = "Block"

        exclusion {
          match_variable = "QueryStringArgNames"
          operator       = "Equals"
          selector       = "innocent"
        }
      }
    }
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }
}