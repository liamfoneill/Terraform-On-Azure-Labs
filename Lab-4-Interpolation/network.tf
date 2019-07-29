resource "azurerm_resource_group" "core" {
    name        = "${var.rg_name}"
    location    = "${var.loc}"
    tags        = "${var.tags}"
}


resource "azurerm_public_ip" "vpnGatewayPublicIp" {
    name                = "vpnGatewayPublicIp"
    location            = "${azurerm_resource_group.core.location}"
    resource_group_name = "${azurerm_resource_group.core.name}"
    tags                = "${azurerm_resource_group.core.tags}"

    allocation_method = "Dynamic"
}

resource "azurerm_virtual_network" "core" {
   name                 = "core"
   location             = "${azurerm_resource_group.core.location}"
   resource_group_name  = "${azurerm_resource_group.core.name}"
   tags                 = "${azurerm_resource_group.core.tags}"

   address_space        = [ "10.0.0.0/16" ]
   dns_servers          = [ "1.1.1.1", "1.0.0.1" ]
}

resource "azurerm_subnet" "core_subnets" {
  count = "${length(var.subnets)}"
  resource_group_name  = "${azurerm_resource_group.core.name}"
  virtual_network_name = "${azurerm_virtual_network.core.name}"
  name = "${var.subnets[count.index]}"
  address_prefix = "10.0.${count.index+1}.0/24"
}