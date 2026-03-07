output "id" {
  description = "NSG ID"
  value       = azurerm_network_security_group.nsg.id
}

output "name" {
  description = "NSG Name"
  value       = azurerm_network_security_group.nsg.name
}