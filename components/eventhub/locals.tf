locals {
  expiresAfter = "2026-12-31"
  common_tags = {
    environment = "sbox"
    managed_by  = "terraform"
    component   = "eventhub"
  }
}
