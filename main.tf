terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group1" {
  name     = "example-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "jrnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource_group1.location
  resource_group_name = azurerm_resource_group.resource_group1.name
}


resource "azurerm_subnet" "junior_subnet" {
  name                 = "junior-subnet"
  resource_group_name  = azurerm_resource_group.resource_group1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]

}