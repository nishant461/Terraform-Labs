variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_service_plan_name" {
  type = string
}

variable "web_app_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "environment" {
  type = string 
}

variable "slot_name" {
  type = string
}

variable "slot_ip_restrictions" {
  type = list(object({
    name       = string
    ip_address = string
    priority   = number
    action     = string
  }))
  default = []

  validation {
    condition     = alltrue([for r in var.slot_ip_restrictions : contains(["Allow","Deny"], r.action)])
    error_message = "Each ip restriction action must be 'Allow' or 'Deny'."
  }
} 