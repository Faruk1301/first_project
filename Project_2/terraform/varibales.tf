variable "location" {
  description = "The Azure region to deploy the resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet-terraform"
}
