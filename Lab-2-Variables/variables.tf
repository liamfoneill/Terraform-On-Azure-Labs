variable "rg_name" {
    default = "terraform-lab2"
}

variable "location" {
    default = "West Europe"
}

variable "tags" {
    type = "map"
    default = {
        Environment = "Training"
        "Team Name" = "Next PLC"
    }
}