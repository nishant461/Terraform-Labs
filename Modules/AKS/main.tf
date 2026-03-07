resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name                = "general"
    vm_size             = var.system_node_pool.vm_size
    vnet_subnet_id      = var.subnet_id
    node_count          = var.system_node_pool.min_count
    
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  role_based_access_control_enabled = true
  tags                              = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_node_pool.vm_size
  vnet_subnet_id        = var.subnet_id
  node_count            = var.user_node_pool.min_count
  mode                  = "User"
}

