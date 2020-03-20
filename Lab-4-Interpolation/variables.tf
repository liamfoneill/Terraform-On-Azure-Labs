variable "rg_name" {
    default = "terraform-lab-04-interpolation"
}
variable "loc" {
    description = "Default Azure region"
    default     =   "West Europe"
}

variable "subnets" {
    description = "A list of subnets for the Core Environment VNET"
    type = list(string)
    default = ["GatewaySubnet", "training", "dev"]
}

variable "nsg_rule_names" {
  type = list(string)
  default = ["http", "https", "ssh", "rdp", "sqlserver"]
}

variable "nsg_rules" {
  description = "A Map of NSG Rules and their Port Numbers"
  type = map(string)
  default = {
      http = 80
      https = 443
      ssh = 22
      rdp = 3389
      sqlserver = 1443
  }
}


variable "tags" {
    type = map(string)
    default = {
        Environment = "Training"
        "Team Name" = "Next"
    }
}