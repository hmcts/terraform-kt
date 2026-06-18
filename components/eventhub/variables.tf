variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "ks-rg"
}

variable "product" {
  description = "product name"
  type        = string
  default     = "mgmt"
}

variable "builtFrom" {
  type        = string
  description = "Built from"
  default     = "hmcts/terraform-kt"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "sbox"
}
