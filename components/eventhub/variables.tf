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
