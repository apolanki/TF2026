
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

}

provider "azurerm" {
  features {}
  subscription_id = "8a109d84-b11c-401d-8e35-624520e33c8d"
}

module "naming" {
  source = "Azure/naming/azurerm"
  version = "0.4.3"
  suffix = ["ap", var.varenvironment, var.varnamingsuffix]
  unique-length = 5
}

# module "naming_virtual_machine" {
#   source = "Azure/naming/azurerm"
#   version = "0.4.3"
#   suffix = ["vm", var.varenvironment, var.varnamingsuffix]
#   unique-length = 5
#   unique-seed = module.naming.unique-seed
# }

# module "naming_virtual_network" {
#   source = "Azure/naming/azurerm"
#   version = "0.4.3"
#   suffix = ["vnet", var.varenvironment, var.varnamingsuffix]
#   unique-length = 5
#   unique-seed = module.naming.unique-seed
  
# }

# module "naming_virtual_network_interface" {
#   source = "Azure/naming/azurerm"
#   version = "0.4.3"
#   suffix = ["nic", var.varenvironment, var.varnamingsuffix]
#   unique-length = 5
#   unique-seed = module.naming.unique-seed
  
# }

# module "naming_subnet" {
#   source = "Azure/naming/azurerm"
#   version = "0.4.3"
#   suffix = ["snet", var.varenvironment, var.varnamingsuffix]
#   unique-length = 5
#   unique-seed = module.naming.unique-seed
  
# }

# module "naming_resource_group" {
#   source = "Azure/naming/azurerm"
#   version = "0.4.3"
#   suffix = ["rg", var.varenvironment, var.varnamingsuffix]
#   unique-length = 5
#   unique-seed = module.naming.unique-seed
  
# }

resource "random_string" "resource_code" {
  length  = 5
  upper   = false
  special = false
  
}


data "azurerm_virtual_machine" "main" {
  name                = azurerm_virtual_machine.main.name
  resource_group_name = azurerm_resource_group.main.name
  
}
