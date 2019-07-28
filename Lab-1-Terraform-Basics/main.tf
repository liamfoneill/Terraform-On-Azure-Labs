provider "azurerm" {
  version = "=1.30.1"
}

resource "azurerm_resource_group" "lab_1" {
  name     = "terraform-lab1"
  location = "West Europe"

  tags = {
    Environment = "Training"
    "Team Name" = "Next PLC"
  }
}

resource "azurerm_storage_account" "lab_1_sa" {
  name                     = "lioneillterraformlab1"
  resource_group_name      = "${azurerm_resource_group.lab_1.name}"
  location                 = "${azurerm_resource_group.lab_1.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}