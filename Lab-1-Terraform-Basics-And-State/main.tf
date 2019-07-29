resource "azurerm_resource_group" "lab_1" {
  name     = "terraform-lab-01-basics"
  location = "West Europe"
  tags = {
    environment = "training"
  }
}

resource "random_string" "rnd" {
  length  = 8
  lower   = false
  number  = true
  upper   = false
  special = false
}

resource "azurerm_storage_account" "lab_1_sa" {
  name                     = "lioneill${random_string.rnd.result}"
  resource_group_name      = "${azurerm_resource_group.lab_1.name}"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  tags = {
    environment = "training"
  }
}