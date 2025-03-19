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
```
## 🛠️ Automate with Azure DevOps

To integrate Terraform with **Azure DevOps**, follow these steps:

### 🟡 Step 1: Create an Azure DevOps Service Connection  
- Go to **Azure DevOps** → **Project Settings** → **Service connections**  
- Create a new **Azure Resource Manager (ARM)** service connection  
- Use **Service Principal (automatic)** authentication  

### 🟡 Step 2: Define the Azure DevOps Pipeline (`azure-pipelines.yml`)  
```yaml
trigger:
- main  # Runs pipeline when main.tf is changed in GitHub

pool:
  vmImage: 'ubuntu-latest'

variables:
- group: azure_credential  # Using your Variable Group

steps:
- checkout: self

- task: TerraformInstaller@1
  displayName: 'Install Terraform'
  inputs:
    terraformVersion: 'latest'

- script: |
    terraform init
  displayName: 'Terraform Init'

- script: |
    terraform plan -out=tfplan -input=false \
      -var "CLIENT_ID=$(CLIENT_ID)" \
      -var "CLIENT_SECRET=$(CLIENT_SECRET)" \
      -var "SUBSCRIPTION_ID=$(SUBSCRIPTION_ID)" \
      -var "TENANT_ID=$(TENANT_ID)"
  displayName: 'Terraform Plan'

- script: |
    terraform apply -auto-approve tfplan
  displayName: 'Terraform Apply'

