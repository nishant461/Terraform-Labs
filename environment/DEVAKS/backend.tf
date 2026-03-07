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
  }
}

provider "azurerm" {
  features {}
}