variable "rg_name" {
    default = "terraform-lab-03-core-environment"
}
variable "loc" {
    description = "Default Azure region"
    default     = "West Europe"
}

variable "tags" {
    type = "map"
    default = {
        Environment = "Training"
        "Team Name" = "Next"
    }
}