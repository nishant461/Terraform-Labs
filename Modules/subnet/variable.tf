variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "name" {
  description = "Name of the subnet"
  type        = string
}
variable "subnet" {
  description = "Map of subnet configurations"
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "vnet_name" {
  description = "Name of the virtual network to which the subnet belongs"
  type        = string

}
variable "tags" {
  description = "Tags for VNet"
  type        = map(string)
  default     = {}
}