output "rg_name" { 
     value = azurerm_resource_group.rg.name 
}

output "aks-name" {
  value = azurerm_kubernetes_cluster.kube_cluster_tf.name
}

output "aks-api-server-fqdn" {
  value = azurerm_kubernetes_cluster.kube_cluster_tf.fqdn
}

output "aks-network-profile" {
  value = azurerm_kubernetes_cluster.kube_cluster_tf.network_profile
}
