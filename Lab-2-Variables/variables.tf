variable "rg_name" {
    default = "terraform-lab-02-variables"
}

variable "location" {
    description = "Please type in West Europe"
}

variable "tags" {
    type = "map"
    default = {
        Environment = "Training"
        "Team Name" = "Next"
    }
}