
provider "azurerm" {
  features {}

  client_id       = "9decc6a2-0185-4bf0-829f-212b9b708ea1"
  client_secret   = var.client_secret  # This will be passed from GitHub Secrets
  subscription_id = "3e80dd4d-6d0e-48ec-a04b-c1401f2963bb"
  tenant_id       = "79a50cb4-fa04-495b-9bd1-7860bc00fe6a"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources1"
  location = "East US"
}

# Define the variable for client_secret
variable "client_secret" {}



