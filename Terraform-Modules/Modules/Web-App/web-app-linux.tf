resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    always_on = true
  }

  app_settings = {
    "ENVIRONMENT" = var.environment
  }

  tags = {
    environment = var.environment
  }
}

resource "azurerm_linux_web_app_slot" "slot" {
  name           = var.slot_name
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
#    always_on = true       # Used for Public Access
    dynamic "ip_restriction" {
      for_each = var.slot_ip_restrictions
      content {
        name       = ip_restriction.value.name
        ip_address = ip_restriction.value.ip_address
        priority   = ip_restriction.value.priority
        action     = ip_restriction.value.action
      }
    }
  }

  app_settings = {
    "ENVIRONMENT" = var.environment
  }

  tags = {
    environment = var.environment
  }
}