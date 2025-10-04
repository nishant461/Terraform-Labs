variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "terraform-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vm_base_name" {
  description = "Base name for VMs"
  type        = string
  default     = "terraform-vm"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VMs (for testing only!)"
  type        = string
  default     = "P@ssw0rd1234!"
  sensitive   = true
}
