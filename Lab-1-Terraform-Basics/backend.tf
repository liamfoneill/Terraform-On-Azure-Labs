terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-state-store-west-europe-production-rg"
    storage_account_name  = "tfstatestorewesteurope"
    container_name        = "terraformstate"
    key                   = "lab-1-terraform-basics.tfstate"
  }
}