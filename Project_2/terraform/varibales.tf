# variables.tf

variable "CLIENT_ID" {
  description = "The Client ID for Azure"
  type        = string
}

variable "CLIENT_SECRET" {
  description = "The Client Secret for Azure"
  type        = string
}

variable "SUBSCRIPTION_ID" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "TENANT_ID" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the Subnet"
  type        = list(string)
}
