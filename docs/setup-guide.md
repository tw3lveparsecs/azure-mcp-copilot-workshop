# Workshop Setup Guide

This guide will help you set up your environment for the GitHub Copilot with Azure MCP Workshop.

## Prerequisites Installation

Before starting the workshop, make sure you have the following tools and software installed:

### 1. Visual Studio Code

Download and install from [https://code.visualstudio.com/download](https://code.visualstudio.com/download)

### 2. GitHub Copilot and GitHub Copilot Chat Extensions

1. Open VS Code
2. Go to Extensions view (Ctrl+Shift+X)
3. Search for "GitHub Copilot" and install it
4. Search for "GitHub Copilot Chat" and install it
5. Sign in with your GitHub account that has Copilot access

### 3. Node.js 20 or Later

Download and install from [https://nodejs.org/en/download](https://nodejs.org/en/download)

### 4. Azure CLI

Follow the instructions for your platform at [https://learn.microsoft.com/en-us/cli/azure/install-azure-cli](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

### 5. Azure Account Setup

1. Make sure you have an active Azure account
2. Log in to Azure CLI by running:

```powershell
az login
```

3. Set your subscription:

```powershell
# List available subscriptions
az account list --output table

# Set the default subscription
az account set --subscription "Your-Subscription-Name-or-ID"
```

## Installing Azure MCP Server

### One-Click Installation (Recommended)

1. Open VS Code in an empty folder
2. Click this [link](https://insiders.vscode.dev/redirect/mcp/install?name=Azure%20MCP%20Server&config=%7B%22command%22%3A%22npx%22%2C%22args%22%3A%5B%22-y%22%2C%22%40azure%2Fmcp%40latest%22%2C%22server%22%2C%22start%22%5D%7D) to install the Azure MCP Server
3. The Command Palette (Ctrl+Shift+P) will open automatically
4. Select "Install Server" from the MCP options
5. Settings will be updated automatically to include the MCP server configuration
6. Once installed, make sure GitHub Copilot is in Agent Mode and refresh the tools list

### Manual Installation

1. Add `.vscode/mcp.json` file to your workspace with:

```json
{
  "servers": {
    "Azure MCP Server": {
      "command": "npx",
      "args": ["-y", "@azure/mcp@latest", "server", "start"]
    }
  }
}
```

2. Once installed, make sure GitHub Copilot is in Agent Mode and refresh the tools list

## Verifying Setup

To verify your setup is working correctly:

1. Open GitHub Copilot in VS Code and switch to [Agent mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode)
2. Check that the Azure MCP Server appears in the list of available tools
3. Try a simple prompt like "List my Azure subscriptions"
4. If everything is set up correctly, Copilot should be able to use Azure MCP to respond with your subscription information

## Creating Workshop Resources

To deploy the resources needed for this workshop:

1. Navigate to the scripts directory
2. Run the setup script:

```powershell
cd scripts
.\setup-resources.ps1
```

This script will create:

- A resource group for the workshop
- A storage account with containers and sample data
- An Azure Cosmos DB account with sample documents
- An Azure AI Search service with indexes
- A Log Analytics workspace
- An Azure Key Vault

## Troubleshooting

If you encounter issues:

- Ensure you're logged in to the Azure CLI with `az login`
- Check that you have the necessary permissions for your Azure subscription
- Verify that Node.js is properly installed and in your PATH
- Try restarting VS Code after installing the Azure MCP server
- Check the Azure MCP Server logs in VS Code's Output panel
