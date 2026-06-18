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
