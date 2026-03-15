############################
# RESOURCE GROUP
############################

module "rg" {
  source   = "../../Modules/resourcegroup"
  name     = "terraform-rg"
  location = "Central India"
}

############################
# VNET + SUBNET
############################

module "vnet" {
  source              = "../../Modules/vnet"
  name                = "vnet-aks-dev"
  location            = module.rg.location
  resource_group_name = module.rg.name
  address_space       = ["10.0.0.0/22"]
}

module "subnet" {
  source              = "../../Modules/subnet"
  name                = "aks-subnet"
  resource_group_name = module.rg.name
  vnet_name           = module.vnet.vnet_name

  subnet = {
    address_prefixes = ["10.0.1.0/24"]
  }
}
############################
# NSG
############################

module "nsg" {
  source              = "../../Modules/NSG"
  name                = "nsg-aks-dev"
  location            = module.rg.location
  resource_group_name = module.rg.name
  subnet_id           = module.subnet.id

  security_rules = {
    allow_https = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

############################
# ROUTE TABLE
############################

# module "route_table" {
#   source              = "../../Modules/route-table"
#   name                = "rt-aks-dev"
#   location            = module.rg.location
#   resource_group_name = module.rg.name
#   subnet_id           = module.vnet.subnet_ids["aks-subnet"]

#   routes = {}
# }

############################
# ACR
############################

module "acr" {
  source              = "../../Modules/ACR"
  name                = "acraksdev12345"
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku                 = "Standard"
}

############################
# LOG ANALYTICS
############################

# resource "azurerm_log_analytics_workspace" "law" {
#   name                = "law-aks-dev"
#   location            = module.rg.location
#   resource_group_name = module.rg.name
#   sku                 = "PerGB2018"
# }

############################
# AKS
############################

module "aks" {
  source              = "../../Modules/AKS"
  cluster_name        = "aks-dev"
  location            = module.rg.location
  resource_group_name = module.rg.name
  dns_prefix          = "aksdev"
  kubernetes_version  = "1.33.0"
  subnet_id           = module.subnet.id

  private_cluster_enabled = true

  system_node_pool = {
    vm_size   = "Standard_DS2_v2"
    min_count = 1
    max_count = 2
  }

  user_node_pool = {
    vm_size   = "Standard_DS2_v2"
    min_count = 1
    max_count = 2
  }
}

############################
# ACR ↔ AKS ROLE
############################

# module "acr_role" {
#   source = "../../Modules/aks-acr-role"
#
#   aks_kubelet_identity_object_id = module.aks.kubelet_identity_object_id
#   acr_id                         = module.acr.id
# }