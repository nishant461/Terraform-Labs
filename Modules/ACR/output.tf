output "id" {
  description = "ACR ID"
  value       = azurerm_container_registry.this.id
}

output "login_server" {
  description = "ACR login server"
  value       = azurerm_container_registry.this.login_server
}

output "name" {
  description = "ACR name"
  value       = azurerm_container_registry.this.name
}