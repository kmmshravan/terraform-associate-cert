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

1. 
resource "azurerm_resource_group" "eachrg" {
    location = var.mlti_region[index.id]
    name = myrg1.
}

variable "multi_region" {
    type = list(string)
    default = ["eastus2", "centralus"]

}
variable "vnet_cidr" {
    type = map(string)
    default = {
        eastus2 = "10.0.0.0/16"
        centralus = "10.1.0.0/16"
    }
}

resource "azurerm_virtual_network" "myvnet" {
    name = "myvnet"
    location = eachrg.location
    resource_group_name = eachrg.
}
### Conditional block example
variable "development_cidr_block" {
    description = "dev environment cidr"
    type = string
    default = "10.0.2.0/24"
}

variable "production_cidr_block" {
    description = "prod environment cidr"
    type = string
    default = "10.0.1.0/24"
}
resource "aws_security_group" "aws_sg" {
    name = aws_sg1
    descritpion = "aws security group"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.environment == "production" ? [var.production_cidr_block] : [var.development_cidr_block] 
    }
}

##variable validation

variable "region" {
    description = "provide region"
    type = string
    default = "eastus2"
    validation {
        condition = contains(["eastus2", "centralus"]), var.region)
        error_message = "region must be eastus2 or centralus"
    }
}
variable "environment" {
    type = string
    default = "dev"
    validation {
        condition = contains("dev", "qa", "prod"), var.environment)
        error_message = "Environment must be dev, qa or prod"
    }
}
variable "multi_region" {
    type = list(string)
    default = ["eastus2", "centralus"]
    validation {
        condition = length(var.multi_region) > 0
        error_message = "at least one region must be provided"
    }
}

variable "cider_block" {
    type = string
    validation {
        condition = can(cidrhost(var.cider_block, 0))
        error_message = "provide proper cider block"
    }
}