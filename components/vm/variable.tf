variable "notes" {
  type        = string
  description = "User defined Notes for the service principal"
  default     = "This service principal created by hmcts/central-app-registration repository"
}

variable "resource_group_name" {
  description = "Resource group name for keyvault"
  type        = string
  default     = "central-app-registration-rg"
}

variable "product" {
  description = "product name"
  type        = string
  default     = "mgmt"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "prod"
}

variable "builtFrom" {
  type        = string
  description = "Built from"
  default     = "hmcts/central-app-registration"
}
