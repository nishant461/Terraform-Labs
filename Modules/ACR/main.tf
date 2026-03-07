resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  tags = var.tags
}


# resource "azurerm_role_assignment" "aks_acr_pull" {
#   principal_id         = module.aks.kubelet_identity_object_id
#   role_definition_name = "AcrPull"
#   scope                = module.acr.id
# }