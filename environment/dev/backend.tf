terraform {
required_version  = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "devst001"
    container_name       = "devcontainer001"
    resource_group_name  = "AKS-RG"
    key                  = "dev.tfstate"

  }
}

provider "azurerm" {
    features {
      
    }
}