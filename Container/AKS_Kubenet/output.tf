output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.cluster_service.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.cluster_service.name
}

output "aks_cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.cluster_service.kubernetes_version
}
output "identity_id" {
  value = azurerm_kubernetes_cluster.cluster_service.kubelet_identity[0].object_id
}