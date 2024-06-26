# Configure the Azure provider
terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
    tls = {
      source = "hashicorp/tls"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "azurerm" {
  features {}
}
