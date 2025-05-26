# Module 1: Resource Groups

This module introduces you to using GitHub Copilot with Azure MCP to work with Azure Resource Groups.

## Learning Objectives

- Understand how to use GitHub Copilot with Azure MCP
- List and explore Azure Resource Groups using natural language queries
- Execute Azure CLI commands with GitHub Copilot assistance

## Prerequisites

- Completed the workshop setup (see [../docs/setup-guide.md](../docs/setup-guide.md))
- Azure CLI installed and authenticated
- Azure MCP Server installed and configured

## Exercises

### Exercise 1.1: Getting Started with Azure MCP

1. Open Visual Studio Code
2. Enable GitHub Copilot Agent mode:
   - Open Command Palette (Ctrl+Shift+P)
   - Search for "GitHub Copilot: Switch to Agent Mode"
   - Select it to enable Agent Mode
3. Verify MCP is installed:
   - Open Command Palette (Ctrl+Shift+P)
   - Search for "MCP: List Servers"
   - You should see "Azure MCP Server" in the list

### Exercise 1.2: Listing Resource Groups

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your resource groups using Azure MCP:
   ```
   List my Azure resource groups using Azure MCP
   ```
3. Observe how Copilot uses the Azure MCP server to fetch this information
4. Try to get more details by asking:
   ```
   Show me more details about the resource groups
   ```

### Exercise 1.3: Creating a Resource Group with Azure MCP

1. Ask GitHub Copilot to help you create a resource group:
   ```
   Help me create a new resource group named 'rg-copilot-demo' in Australia East region using Azure MCP
   ```
2. Review the command that Copilot suggests
3. Execute the command via Azure MCP
4. Verify the resource group was created by asking Copilot:
   ```
   List my resource groups and check if rg-copilot-demo was created
   ```

### Exercise 1.4: Exploring Resource Group Properties

1. Ask Copilot to show properties of your newly created resource group:
   ```
   Show me the properties of resource group rg-copilot-demo
   ```
2. Ask for specific metadata:
   ```
   When was the rg-copilot-demo resource group created?
   ```

### Exercise 1.5: Adding Tags to Resource Group

1. Ask Copilot to help you add tags to your resource group:
   ```
   Add tags to rg-copilot-demo: Environment=Development, Project=MCPWorkshop, Owner=MyName
   ```
2. Execute the suggested command
3. Verify the tags were added by asking:
   ```
   Show me the tags on rg-copilot-demo
   ```

## Challenge Exercise

Create a script that:

1. Lists all resource groups
2. Filters for resource groups that contain "workshop" in their name
3. Displays the creation date and tags for each matching resource group

Ask GitHub Copilot to help you create this script.

## Knowledge Check

1. How does Azure MCP enhance GitHub Copilot's capabilities when working with Azure resources?
2. What are the advantages of using natural language queries with MCP compared to memorising Azure CLI commands?
3. How can you use Copilot to explore resource group properties that you might not know about?

## Next Steps

Proceed to [Module 2: Azure Storage](../02-azure-storage/README.md) to learn how to work with storage accounts, containers, and blobs.
