
terraform {
  required_version = ">= 1.7.5"

  backend "azurerm" {
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.2.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb" # DCD-CFTAPPS-SBOX
  features {}
}

provider "azurerm" {
  alias                      = "cnp"
  skip_provider_registration = "true"
  features {}
  subscription_id = var.env == "nonprod" ? "1c4f0704-a29e-403d-b719-b90c34ef14c9" : "8999dec3-0104-4a27-94ee-6588559729d1"
}

provider "azurerm" {
  alias                      = "soc"
  skip_provider_registration = "true"
  features {}
  subscription_id = "8ae5b3b6-0b12-4888-b894-4cec33c92292"
}

provider "azurerm" {
  features {}
  subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  alias           = "DTS-CFTPTL-INTSVC"
}
