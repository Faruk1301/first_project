# Declare the variables
variable "CLIENT_ID" {
  description = "The client ID for the Azure AD application."
  type        = string
}

variable "CLIENT_SECRET" {
  description = "The client secret for the Azure AD application."
  type        = string
  sensitive   = true
}

variable "SUBSCRIPTION_ID" {
  description = "The Azure subscription ID."
  type        = string
}

variable "TENANT_ID" {
  description = "The Azure tenant ID."
  type        = string
}

# Provider block
provider "azurerm" {
  features {}

  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  subscription_id = var.SUBSCRIPTION_ID
  tenant_id       = var.TENANT_ID
}

# Resource block
resource "azurerm_resource_group" "example" {
  name     = "example-resources3"
  location = "East US"
}

