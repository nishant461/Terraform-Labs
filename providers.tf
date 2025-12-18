terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  tenant_id       = "91407618-9c60-4397-bdb6-b3607361e938"
  subscription_id = "e68b40bf-5f8d-4484-b9f3-2da3d7e23167"
  client_id       = "f2a61b92-d0da-4951-a768-5b00f7d896ce"
  client_secret   = "9Cv8Q~jtXNI6m14n2uVLBYTy~wD83xHJ9rPbucu3"
  features {}
}