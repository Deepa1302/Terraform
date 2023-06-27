//variable "webAppFirewallPolicy_FilePath"{}
variable "wafPolicy_name"{}
variable "resource_group_name"{}
variable "location"{}
variable "ob_custom_rules" {
    default = []
}
variable "ob_policy_settings" {
    default = []
}
variable "ob_managed_rules" {
    default = []
}

variable "waf_tags" {
    default = {}
  
}