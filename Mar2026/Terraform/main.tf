module "deploy_infra" {
  source = "././Modules"



}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-polanki-test"
    storage_account_name = "sapolankitesttfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}

