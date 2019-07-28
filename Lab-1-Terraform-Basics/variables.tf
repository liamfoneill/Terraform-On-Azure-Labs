variable "resource_group_name" {
    default = "terraform-lab-01-basics"
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