terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>3.0"

        }
        
    }
}
provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rg" {
    location = var.location
    name = "${var.environment}-${var.owner}-rg"
}

resource "azurerm_resource_group" "rg2" {
    location = var.location
    count = var.vmcount
    name = "rg-${count.index}"

}

