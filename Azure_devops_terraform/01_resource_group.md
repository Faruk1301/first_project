# 📌 Terraform Deployment: Azure Resource Group  

## 📝 Overview  
This guide explains how to create an **Azure Resource Group** using **Terraform**. The Terraform files are stored in **GitHub**, and the deployment is automated using **Azure DevOps Pipelines**.

---

## 🎯 Objectives  
- Set up **Terraform** to deploy an Azure Resource Group.  
- Automate deployment using **Azure DevOps Pipelines**.  
- Ensure Infrastructure as Code (IaC) best practices.

---

## 📂 Project Structure  
📁 Azure_devops_terraform/ │── main.tf # Terraform configuration file
│── azure-pipelines.yml # Azure DevOps pipeline for automation 

🛠 Terraform Configuration (main.tf) 

## 🛠 Terraform Configuration (`main.tf`)

```hcl
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

