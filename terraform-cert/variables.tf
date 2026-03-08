variable "test_variable" {
    description = "test variable"
    type = string
    default = "testvalue1"
}
variable "location" {
    description = "provide cloud locaiton"
    type = string
    default = "eastus2"
}
variable "project_name" {
    description = "provide project name"
    type = string
    default = "terraform_study"
}

variable "environment" {
    description = "provide environment"
    type = string
    default = "test"
}

variable "owner" {
    description = "provide owner"
    type = string
    default = "me"
}

variable "vmcount" {
    description = "provide number of VMs"
    type = number
    default = 2
}