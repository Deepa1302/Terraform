output "id"{
    value = azurerm_firewall_policy.policy.id
}
output "child_policies"{
    value = azurerm_firewall_policy.policy.child_policies
}
output "firewalls"{
    value = azurerm_firewall_policy.policy.firewalls
}
output "rule_collection_groups"{
    value = azurerm_firewall_policy.policy.rule_collection_groups
}