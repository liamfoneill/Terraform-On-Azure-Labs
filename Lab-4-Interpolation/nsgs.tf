resource "azurerm_network_security_group" "resource_group_default" {
   name = "MyNetworkSecurityGroup"
   resource_group_name  = azurerm_resource_group.core.name
   location             = azurerm_resource_group.core.location
   tags                 = azurerm_resource_group.core.tags
}

resource "azurerm_network_security_rule" "AllowRules" {
    count = length(var.nsg_rule_names)
    name = "Allow${var.nsg_rule_names[count.index]}"
    resource_group_name         = azurerm_resource_group.core.name
    network_security_group_name = azurerm_network_security_group.resource_group_default.name

    priority                    = "10${count.index+1}0"
    access                      = "Allow"
    direction                   = "Inbound"
    protocol                    = "Tcp"
    destination_port_range      = lookup(var.nsg_rules, var.nsg_rule_names[count.index], "")
    destination_address_prefix  = "*"
    source_port_range           = "*"
    source_address_prefix       = "*"
}

resource "azurerm_network_security_group" "nic_ubuntu" {
   name = "NIC_Ubuntu"
   resource_group_name  = azurerm_resource_group.core.name
   location             = azurerm_resource_group.core.location
   tags                 = azurerm_resource_group.core.tags

    security_rule {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = 22
        source_address_prefix      = "*"
        destination_address_prefix = "*"
  }
}

  resource "azurerm_network_security_group" "nic_windows" {
   name = "NIC_Windows"
   resource_group_name  = azurerm_resource_group.core.name
   location             = azurerm_resource_group.core.location
   tags                 = azurerm_resource_group.core.tags

    security_rule {
        name                       = "RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = 3389
        source_address_prefix      = "*"
        destination_address_prefix = "*"
  }
}