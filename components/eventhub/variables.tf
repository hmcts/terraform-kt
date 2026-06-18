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
  default     = "github.com/hmcts/terraform-kt"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "sbox"
}

variable "expiresAfter" {
  type        = string
  description = "Resource expiration date"
  default     = "2026-12-31"
}
