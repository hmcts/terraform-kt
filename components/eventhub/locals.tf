locals {
  expiresAfter = "2026-12-31"
  common_tags = {
    environment = var.env
    product     = var.product
    builtFrom   = var.builtFrom
    managed_by  = "terraform"
    owner       = "Platform Engineering"
  }
}
