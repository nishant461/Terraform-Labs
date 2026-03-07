variable "cluster_name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "dns_prefix" { type = string }
variable "kubernetes_version" { type = string }

variable "subnet_id" { type = string }
variable "log_analytics_workspace_id" { type = string }

variable "private_cluster_enabled" {
  type    = bool
  default = false
}

variable "system_node_pool" {
  type = object({
    vm_size    = string
    min_count  = number
    max_count  = number
  })
}

variable "user_node_pool" {
  type = object({
    vm_size    = string
    min_count  = number
    max_count  = number
  })
}

variable "tags" {
  type    = map(string)
  default = {}
}