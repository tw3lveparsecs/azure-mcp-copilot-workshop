# Setup Script for Azure MCP Workshop
# This script creates all necessary Azure resources for the workshop

# Parameters
param(
  [string]$ResourceGroupName = "rg-mcp-workshop",
  [string]$Location = "australiaeast",
  [string]$StorageAccountName = "samcpworkshop$(Get-Random -Minimum 100 -Maximum 999)",
  [string]$CosmosDBAccountName = "cosmosdb-mcp-workshop$(Get-Random -Minimum 100 -Maximum 999)",
  [string]$SearchServiceName = "search-mcp-workshop$(Get-Random -Minimum 100 -Maximum 999)",
  [string]$LogAnalyticsWorkspaceName = "log-mcp-workshop$(Get-Random -Minimum 100 -Maximum 999)",
  [string]$KeyVaultName = "kv-mcp-workshop$(Get-Random -Minimum 100 -Maximum 999)"
)

# Display script banner
Write-Host "==============================================" -ForegroundColor Green
Write-Host "     Azure MCP Workshop - Setup Script        " -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

# Check if user is logged in to Azure (using Azure CLI)
try {
  $context = az account show | ConvertFrom-Json -ErrorAction Stop
  if (-not $context) {
    Write-Host "You are not logged in to Azure. Please run 'az login' first." -ForegroundColor Red
    exit 1
  }
}
catch {
  Write-Host "You are not logged in to Azure. Please run 'az login' first." -ForegroundColor Red
  exit 1
}

# Display current subscription
Write-Host "Using subscription: $($context.name) ($($context.id))" -ForegroundColor Yellow
Write-Host "Creating resources in location: $Location" -ForegroundColor Yellow
Write-Host ""

# Store all resource info in a config file
$configPath = "$PSScriptRoot\..\workshop-config.json"
$config = @{
  ResourceGroupName         = $ResourceGroupName
  Location                  = $Location
  StorageAccountName        = $StorageAccountName
  CosmosDBAccountName       = $CosmosDBAccountName
  SearchServiceName         = $SearchServiceName
  LogAnalyticsWorkspaceName = $LogAnalyticsWorkspaceName
  KeyVaultName              = $KeyVaultName
}

# Create Resource Group
Write-Host "Creating Resource Group: $ResourceGroupName..." -ForegroundColor Cyan
az group create --name $ResourceGroupName --location $Location --output json
Write-Host "Resource Group created successfully!" -ForegroundColor Green
Write-Host ""

# Create Storage Account
Write-Host "Creating Storage Account: $StorageAccountName..." -ForegroundColor Cyan
az storage account create `
  --name $StorageAccountName `
  --resource-group $ResourceGroupName `
  --location $Location `
  --sku Standard_LRS `
  --kind StorageV2 `
  --enable-hierarchical-namespace false `
  --output json

# Get storage account key for container creation
Write-Host "Getting storage account key..." -ForegroundColor Cyan
$storageAccountKey = $(az storage account keys list --resource-group $ResourceGroupName --account-name $StorageAccountName --query [0].value -o tsv)
Write-Host "Retrieved storage account key." -ForegroundColor Green

# Create containers
$containers = @("documents", "images", "logs", "backup", "data")
foreach ($container in $containers) {
  Write-Host "Creating container: $container..." -ForegroundColor Cyan
  az storage container create `
    --name $container `
    --account-name $StorageAccountName `
    --account-key $storageAccountKey `
    --output json
}

# Upload sample blobs
$sampleDataPath = "$PSScriptRoot\..\sample-data\blob-content"

# Create sample JSON files if they don't exist
if (-not (Test-Path "$sampleDataPath\config.json")) {
  $configJson = @{
    "appName"     = "AzureMCPWorkshop"
    "version"     = "1.0.0"
    "environment" = "dev"
    "settings"    = @{
      "timeout"  = 30
      "retries"  = 3
      "logLevel" = "info"
    }
  } | ConvertTo-Json -Depth 4
  New-Item -Path "$sampleDataPath" -ItemType Directory -Force | Out-Null
  Set-Content -Path "$sampleDataPath\config.json" -Value $configJson
}

if (-not (Test-Path "$sampleDataPath\users.json")) {
  $usersJson = @(
    @{
      "id"    = 1
      "name"  = "John Doe"
      "email" = "john.doe@example.com"
      "role"  = "admin"
    },
    @{
      "id"    = 2
      "name"  = "Jane Smith"
      "email" = "jane.smith@example.com"
      "role"  = "developer"
    },
    @{
      "id"    = 3
      "name"  = "Bob Johnson"
      "email" = "bob.johnson@example.com"
      "role"  = "analyst"
    }
  ) | ConvertTo-Json -Depth 4
  Set-Content -Path "$sampleDataPath\users.json" -Value $usersJson
}

if (-not (Test-Path "$sampleDataPath\products.json")) {
  $productsJson = @(
    @{
      "id"       = "p001"
      "name"     = "Azure Cloud Services"
      "category" = "Cloud Computing"
      "price"    = 199.99
      "tags"     = @("cloud", "azure", "services")
    },
    @{
      "id"       = "p002"
      "name"     = "Data Analytics Suite"
      "category" = "Analytics"
      "price"    = 299.99
      "tags"     = @("data", "analytics", "insights")
    },
    @{
      "id"       = "p003"
      "name"     = "Security Monitoring"
      "category" = "Security"
      "price"    = 149.99
      "tags"     = @("security", "monitoring", "protection")
    }
  ) | ConvertTo-Json -Depth 4
  Set-Content -Path "$sampleDataPath\products.json" -Value $productsJson
}

# Upload files to blob storage
Write-Host "Uploading sample data to blob storage..." -ForegroundColor Cyan

foreach ($file in Get-ChildItem -Path $sampleDataPath -File) {
  $containerName = "data"
  az storage blob upload `
    --account-name $StorageAccountName `
    --container-name $containerName `
    --name $file.Name `
    --file $file.FullName `
    --account-key $storageAccountKey `
    --output json
  Write-Host "Uploaded $($file.Name) to container: $containerName" -ForegroundColor Green
}

# Create Azure Table
Write-Host "Creating Azure Table..." -ForegroundColor Cyan
$tableName = "SampleTable"
az storage table create `
  --name $tableName `
  --account-name $StorageAccountName `
  --account-key $storageAccountKey `
  --output json

Write-Host "Storage account and resources created successfully!" -ForegroundColor Green
Write-Host ""

# Create Cosmos DB Account
Write-Host "Creating Cosmos DB Account: $CosmosDBAccountName..." -ForegroundColor Cyan
az cosmosdb create `
  --name $CosmosDBAccountName `
  --resource-group $ResourceGroupName `
  --kind GlobalDocumentDB `
  --default-consistency-level Session `
  --locations regionName=$Location `
  --output json

# Create Cosmos DB Database
$cosmosDBName = "WorkshopDatabase"
Write-Host "Creating Cosmos DB Database: $cosmosDBName..." -ForegroundColor Cyan
az cosmosdb sql database create `
  --account-name $CosmosDBAccountName `
  --resource-group $ResourceGroupName `
  --name $cosmosDBName `
  --output json

# Create Cosmos DB Container
$containerName = "SampleContainer"
Write-Host "Creating Cosmos DB Container: $containerName..." -ForegroundColor Cyan
az cosmosdb sql container create `
  --account-name $CosmosDBAccountName `
  --resource-group $ResourceGroupName `
  --database-name $cosmosDBName `
  --name $containerName `
  --partition-key-path "/id" `
  --throughput 400 `
  --output json

# Create another Cosmos DB Container
$containerName2 = "Products"
Write-Host "Creating Cosmos DB Container: $containerName2..." -ForegroundColor Cyan
az cosmosdb sql container create `
  --account-name $CosmosDBAccountName `
  --resource-group $ResourceGroupName `
  --database-name $cosmosDBName `
  --name $containerName2 `
  --partition-key-path "/category" `
  --throughput 400 `
  --output json

# Note: We would insert items into containers here, but that's better done with SDK
# The workshop exercises will include adding items through Azure MCP

Write-Host "Cosmos DB account and resources created successfully!" -ForegroundColor Green
Write-Host ""

# Create Azure AI Search Service
Write-Host "Creating Azure AI Search Service: $SearchServiceName..." -ForegroundColor Cyan
az search service create `
  --name $SearchServiceName `
  --resource-group $ResourceGroupName `
  --sku Basic `
  --location $Location `
  --output json

# Note: Creating search indexes would typically be done with REST API
# The workshop exercises will guide through creating indexes

Write-Host "Azure AI Search Service created successfully!" -ForegroundColor Green
Write-Host ""

# Create Log Analytics Workspace
Write-Host "Creating Log Analytics Workspace: $LogAnalyticsWorkspaceName..." -ForegroundColor Cyan
az monitor log-analytics workspace create `
  --resource-group $ResourceGroupName `
  --workspace-name $LogAnalyticsWorkspaceName `
  --location $Location `
  --output json

Write-Host "Log Analytics Workspace created successfully!" -ForegroundColor Green
Write-Host ""

# Create Key Vault
Write-Host "Creating Key Vault: $KeyVaultName..." -ForegroundColor Cyan

# Get current user object ID for key vault permissions
Write-Host "Getting current user object ID..." -ForegroundColor Cyan
$currentUserObjectId = $(az ad signed-in-user show --query id -o tsv)
Write-Host "Current user object ID: $currentUserObjectId" -ForegroundColor Green

# Create Key Vault with RBAC authorization enabled
az keyvault create `
  --name $KeyVaultName `
  --resource-group $ResourceGroupName `
  --location $Location `
  --enable-rbac-authorization true `
  --enabled-for-deployment true `
  --enabled-for-disk-encryption true `
  --enabled-for-template-deployment true `
  --sku standard `
  --output json

# Get the Key Vault resource ID for role assignment
Write-Host "Getting Key Vault resource ID..." -ForegroundColor Cyan
$keyVaultResourceId = $(az keyvault show --name $KeyVaultName --resource-group $ResourceGroupName --query id -o tsv)
Write-Host "Key Vault resource ID: $keyVaultResourceId" -ForegroundColor Green

# Assign Key Vault Administrator role to the current user
Write-Host "Assigning Key Vault Administrator role to current user..." -ForegroundColor Cyan
az role assignment create `
  --assignee $currentUserObjectId `
  --role "Key Vault Administrator" `
  --scope $keyVaultResourceId `
  --output json

# Wait for role assignment to propagate
Write-Host "Waiting for role assignment to propagate (30 seconds)..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

# Create sample keys with retry logic
Write-Host "Creating sample keys in Key Vault..." -ForegroundColor Cyan
$maxRetries = 3
$retryCount = 0
$success = $false

while (-not $success -and $retryCount -lt $maxRetries) {
  try {
    Write-Host "Attempting to create WorkshopKey1 (Attempt $($retryCount + 1))..." -ForegroundColor Cyan
    az keyvault key create `
      --vault-name $KeyVaultName `
      --name "WorkshopKey1" `
      --protection software `
      --output json

    Write-Host "Attempting to create WorkshopKey2 (Attempt $($retryCount + 1))..." -ForegroundColor Cyan
    az keyvault key create `
      --vault-name $KeyVaultName `
      --name "WorkshopKey2" `
      --protection software `
      --output json

    $success = $true
    Write-Host "Keys created successfully!" -ForegroundColor Green
  }
  catch {
    $retryCount++
    if ($retryCount -lt $maxRetries) {
      Write-Host "Role assignment may not have fully propagated yet. Waiting 30 seconds before retrying..." -ForegroundColor Yellow
      Start-Sleep -Seconds 30
    }
    else {
      Write-Host "Failed to create keys after $maxRetries attempts." -ForegroundColor Red
      Write-Host "You may need to run this script again after waiting a few minutes for role assignments to fully propagate." -ForegroundColor Red
    }
  }
}

# Create sample secrets with retry logic
Write-Host "Creating sample secrets in Key Vault..." -ForegroundColor Cyan
$maxRetries = 3
$retryCount = 0
$success = $false

while (-not $success -and $retryCount -lt $maxRetries) {
  try {
    Write-Host "Attempting to create secrets (Attempt $($retryCount + 1))..." -ForegroundColor Cyan
    az keyvault secret set `
      --vault-name $KeyVaultName `
      --name "DatabaseConnectionString" `
      --value "Server=myserver;Database=mydb;User Id=admin;Password=dummy-password;" `
      --output json

    az keyvault secret set `
      --vault-name $KeyVaultName `
      --name "ApiKey" `
      --value "dummy-api-key-value-for-workshop" `
      --output json

    $success = $true
    Write-Host "Secrets created successfully!" -ForegroundColor Green
  }
  catch {
    $retryCount++
    if ($retryCount -lt $maxRetries) {
      Write-Host "Role assignment may not have fully propagated yet. Waiting 30 seconds before retrying..." -ForegroundColor Yellow
      Start-Sleep -Seconds 30
    }
    else {
      Write-Host "Failed to create secrets after $maxRetries attempts." -ForegroundColor Red
      Write-Host "You may need to run this script again after waiting a few minutes for role assignments to fully propagate." -ForegroundColor Red
    }
  }
}

Write-Host "Key Vault and secrets created successfully!" -ForegroundColor Green
Write-Host ""

# Save configuration
$config | ConvertTo-Json -Depth 4 | Set-Content -Path $configPath
Write-Host "Configuration saved to: $configPath" -ForegroundColor Yellow
Write-Host ""

# Display summary of created resources
Write-Host "==============================================" -ForegroundColor Green
Write-Host "       Workshop Resources Created             " -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host "Resource Group:            $ResourceGroupName" -ForegroundColor White
Write-Host "Storage Account:           $StorageAccountName" -ForegroundColor White
Write-Host "Cosmos DB Account:         $CosmosDBAccountName" -ForegroundColor White
Write-Host "Azure AI Search Service:   $SearchServiceName" -ForegroundColor White
Write-Host "Log Analytics Workspace:   $LogAnalyticsWorkspaceName" -ForegroundColor White
Write-Host "Key Vault:                 $KeyVaultName" -ForegroundColor White
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "You can now proceed with the workshop exercises." -ForegroundColor Green
