
resource "azurerm_kubernetes_cluster_node_pool" "aks"{
  kubernetes_cluster_id = var.cluster_id 
  #count                 = var.nodepool_count 
  name                  = var.nodepool_name 
  node_count            = var.agent_count
  os_disk_size_gb       = var.os_disk_size_gb  
  vm_size               = var.agent_size 
  enable_auto_scaling   = "true"
  min_count             = var.min_count
  max_count             = var.max_count
  os_type               = var.os_type  
  vnet_subnet_id        = var.vnet_subnet_id 
  max_pods              = var.max_pods
  orchestrator_version  = var.kubernetes_version
  zones                 = var.availability_zones
  mode                   = var.mode
  os_sku                 = var.os_sku
  tags                  = var.tier_tags
  #node_labels           = var.node_labels
  #node_taints           = var.node_taints
}
