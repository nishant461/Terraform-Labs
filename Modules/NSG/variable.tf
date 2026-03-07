variable "name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "security_rules" {
  description = "Map of NSG rules"
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "subnet_id" {
  description = "Subnet ID to associate NSG (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for NSG"
  type        = map(string)
  default     = {}
}