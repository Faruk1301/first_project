
# Declare the necessary variables
variable "subscription_id" {
  description = "The subscription ID"
}

variable "client_id" {
  description = "The client ID"
}

variable "client_secret" {
  description = "The client secret"
  sensitive   = true
}

variable "tenant_id" {
  description = "The tenant ID"
}

# Use the declared variables in the provider configuration
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
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
