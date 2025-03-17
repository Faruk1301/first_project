provider "azurerm" {
  features {}

  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  subscription_id = var.SUBSCRIPTION_ID
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources3"
  location = "East US"
}


