module "ctags" {
  source = "github.com/hmcts/terraform-module-common-tags.git?ref=master"

  builtFrom   = var.builtFrom
  environment = var.env
  product     = var.product
}

locals {
  expiresAfter = "2026-12-31"
}
