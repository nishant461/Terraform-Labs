#################################
# RESOURCE GROUP
#################################

output "resource_group_name" {
  description = "Resource group name"
  value       = module.rg.name
}

#################################
# VNET
#################################

output "vnet_name" {
  description = "Virtual network name"
  value       = module.vnet.vnet_name
}

#################################
# SUBNET
#################################

output "subnet_id" {
  description = "Subnet ID used by AKS"
  value       = module.subnet.id
}

#################################
# ACR
#################################

output "acr_id" {
  description = "Azure Container Registry ID"
  value       = module.acr.id
}

output "acr_login_server" {
  description = "ACR login server"
  value       = module.acr.login_server
}

#################################
# AKS
#################################

output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = module.aks.cluster_name
}

output "aks_kubeconfig" {
  description = "AKS kubeconfig"
  value       = module.aks.kube_config
  sensitive   = true
}

output "aks_kubelet_identity_object_id" {
  description = "AKS kubelet identity object id"
  value       = module.aks.kubelet_identity_object_id
}