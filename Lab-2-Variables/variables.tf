variable "rg_name" {
    default = "terraform-lab-02-variables"
}

variable "location" {
    default = "West Europe"
}

variable "tags" {
    type = "map"
    default = {
        Environment = "Training"
        "Team Name" = "Next"
    }
}