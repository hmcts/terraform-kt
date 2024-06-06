variable "notes" {
  type        = string
  description = "User defined Notes for the service principal"
  default     = "This test created by hmcts/terraform-kt repository"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "terraform-kt-rg"
}

variable "product" {
  description = "product name"
  type        = string
  default     = "mgmt"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "sbox"
}

variable "builtFrom" {
  type        = string
  description = "Built from"
  default     = "hmcts/terraform-kt"
}
