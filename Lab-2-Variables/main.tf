resource "azurerm_resource_group" "lab_2" {
  name      = "${var.rg_name}"
  location  = "${var.location}"
  tags      = "${var.tags}"
}

resource "random_string" "rnd" {
  length  = 8
  lower   = false
  number  = true
  upper   = false
  special = false
}

resource "azurerm_storage_account" "lab_2_sa" {
  name                     = "lioneill${random_string.rnd.result}"
  resource_group_name      = "${azurerm_resource_group.lab_2.name}"
  location                 = "${azurerm_resource_group.lab_2.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  tags                     = "${var.tags}"
}