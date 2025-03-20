trigger:
  branches:
    include:
      - main  # Runs only on main branch changes

variables:
  azureServiceConnection: 'azure-sc'  # Azure DevOps Service Connection
  azureRegion: 'East US'  # Azure region
  resourceGroupName: 'rg-terraform-vnet'  
  vnetName: 'vnet-terraform'
  subnetName: 'subnet-terraform'

pool:
  vmImage: 'ubuntu-latest'

steps:
  - script: |
      echo "Checking if Terraform is installed..."
      if ! command -v terraform &> /dev/null; then
        echo "Terraform not found. Installing..."
        curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update && sudo apt install terraform -y
      else
        echo "Terraform is already installed: $(terraform version)"
      fi
    displayName: 'Install Terraform (if not installed)'

  - script: |
      terraform init
    displayName: 'Initialize Terraform'
    timeoutInMinutes: 5

  - script: |
      terraform validate
    displayName: 'Validate Terraform Configuration'
    timeoutInMinutes: 5

  - script: |
      terraform plan -out=tfplan
    displayName: 'Terraform Plan'
    timeoutInMinutes: 10
    continueOnError: false  # Fails pipeline if plan step fails

  - script: |
      terraform apply -auto-approve
    displayName: 'Apply Terraform Configuration'
    timeoutInMinutes: 10
    continueOnError: false  # Fails pipeline if apply step fails

  - script: |
      terraform output
    displayName: 'Show Terraform Outputs'
    timeoutInMinutes: 5


