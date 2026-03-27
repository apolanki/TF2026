terraform {
  required_version = ">= 1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }

    #   azuread = {
    #     source  = "hashicorp/azuread"
    #     version = ">= 2.47.0"
    #   }
  }

  backend "azurerm" {
    resource_group_name  = "rg-polanki-prod"
    storage_account_name = "sapolankitfstateprod"
    container_name       = "tfstateprod"
    key                  = "terraform.tfstate"

  }

}

provider "azurerm" {
  features {}
  subscription_id = "8a109d84-b11c-401d-8e35-624520e33c8d"
}

