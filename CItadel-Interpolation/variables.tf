variable "rg_name" {
    default = "terraform-lab-04-interpolation"
}

variable "loc" {
    description = "Default Azure region"
    default     =   "westeurope"
}

variable "tags" {
    type = "map"
    default = {
        Environment = "Training"
        "Team Name" = "Next"
    }
}

variable "webapplocs" {
    description = "List of locations for web apps"
    type        = "list"
    default     = []
}