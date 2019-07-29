terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform-State-Storage-North-Europe"
    storage_account_name  = "tfstatestorenortheurope"
    container_name        = "terraformstate"
    key                   = "lab-5-modularisation.tfstate"
  }
}