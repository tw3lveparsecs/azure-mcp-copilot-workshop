# Teardown Script for Azure MCP Workshop
# This script deletes all Azure resources created for the workshop

# Parameters
param(
  [switch]$Force = $false
)

# Get configuration from the config file
$configPath = "$PSScriptRoot\..\workshop-config.json"
if (-not (Test-Path $configPath)) {
  Write-Host "Configuration file not found. Please run the setup script first." -ForegroundColor Red
  exit 1
}

$config = Get-Content -Path $configPath | ConvertFrom-Json

# Display script banner
Write-Host "==============================================" -ForegroundColor Yellow
Write-Host "    Azure MCP Workshop - Teardown Script      " -ForegroundColor Yellow
Write-Host "==============================================" -ForegroundColor Yellow
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
Write-Host ""

# Display resources to be deleted
Write-Host "The following resources will be deleted:" -ForegroundColor Yellow
Write-Host "Resource Group:            $($config.ResourceGroupName)" -ForegroundColor White
Write-Host "Storage Account:           $($config.StorageAccountName)" -ForegroundColor White
Write-Host "Cosmos DB Account:         $($config.CosmosDBAccountName)" -ForegroundColor White
Write-Host "Azure AI Search Service:   $($config.SearchServiceName)" -ForegroundColor White
Write-Host "Log Analytics Workspace:   $($config.LogAnalyticsWorkspaceName)" -ForegroundColor White
Write-Host "Key Vault:                 $($config.KeyVaultName)" -ForegroundColor White
Write-Host ""

# Confirm deletion
if (-not $Force) {
  $confirmation = Read-Host "Are you sure you want to delete these resources? (y/n)"
  if ($confirmation -ne "y") {
    Write-Host "Teardown cancelled." -ForegroundColor Yellow
    exit 0
  }
}

# Delete the entire resource group
Write-Host "Deleting Resource Group: $($config.ResourceGroupName)..." -ForegroundColor Cyan
az group delete --name $config.ResourceGroupName --yes --no-wait
Write-Host "Resource deletion initiated. This may take several minutes to complete." -ForegroundColor Green
Write-Host ""

# Clean up the config file
Remove-Item -Path $configPath -Force
Write-Host "Configuration file removed." -ForegroundColor Yellow

Write-Host "==============================================" -ForegroundColor Yellow
Write-Host "       Teardown Process Initiated             " -ForegroundColor Yellow
Write-Host "==============================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "All workshop resources are being deleted. The process will continue in the background." -ForegroundColor Green
Write-Host "To verify deletion, check the Azure portal or run: az group show -n $($config.ResourceGroupName)" -ForegroundColor Green
