
# Declare the necessary variables
variable "SUBSCRIPTION_ID" {
  description = "The subscription ID"
}

variable "CLIENT_ID" {
  description = "The client ID"
}

variable "CLIENT_SECRET" {
  description = "The client secret"
  sensitive   = true
}

variable "TENANT_ID" {
  description = "The tenant ID"
}

# Use the declared variables in the provider configuration
provider "azurerm" {
  features {}

  SUBSCRIPTION_ID = var.SUBSCRIPTION_ID
  CLIENT_ID       = var.CLIENT_ID
  CLIENT_SECRET   = var.CLIENT_SECRET
  TENANT_ID       = var.TENANT_ID
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "RG1"
  location = "East US"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Output the virtual network name
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
