terraform {

  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "nidhi123456"
    container_name       = "terraformbackup"
    key                  = "aks-dev.terraform.tfstate"
    subscription_id      = "e68b40bf-5f8d-4484-b9f3-2da3d7e23167"
    tenant_id            = "91407618-9c60-4397-bdb6-b3607361e938"
    client_id            = "aa51c2c4-b65e-47f2-98b0-1c495e091acc"
    client_secret        = "JGY8Q~M522XL_kI2WPaKIPf.QKtSJEKHXYfzpbcw"
  }
}