provider "azurerm" {
   features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "Core-Infrastructure-Production"
    storage_account_name  = "liamcoreinfraprod"
    container_name        = "terraformstate"
    key                   = "lab-4-interpolation.tfstate"
  }
}