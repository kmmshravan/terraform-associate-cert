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

variable "enable_monitoring" {
  description = "need monitoring or not"
  type = bool
  default = "true"
}

variable "locations" {
  description = "provide locations"
  type = list(string)
  default = ["eastus2", "centralus"]
}

resource "azurerm_resource_group" "rg3" {
  count = length(var.locations)
  location = var.locations[count.index]
  name = "rg-${var.locations[count.index]}"
}

resource "azurerm_resource_group" "rg4" {
  for_each = toset(var.locations)
  name = "rg-${each.value}"
  location = each.value
}

variable "vm_sizes" {
  type = map(string)
  default = {
    dev = "Standard_B1s"
    test = "Standard_D2s"
  }
}
