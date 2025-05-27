# Module 2: Azure Storage

This module focuses on using GitHub Copilot with Azure MCP to work with Azure Storage accounts, containers, blobs, and tables.

## Learning Objectives

- Create and manage Azure Storage accounts
- Work with blob containers and blobs using natural language queries
- Explore Azure Table storage
- Retrieve container properties and metadata

## Prerequisites

- Completed Module 1: Resource Groups
- Azure Storage account created (either manually or via the setup script)

## Exercises

### Exercise 2.1: Listing Storage Accounts

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your storage accounts using Azure MCP:
   ```
   List my Azure storage accounts using Azure MCP
   ```
3. Request additional information about a specific storage account:
   ```
   Show me details about storage account [your-account-name]
   ```

### Exercise 2.2: Creating a Storage Account with Azure MCP

1. Ask GitHub Copilot to help you create a storage account:
   ```
   Help me create a new storage account named 'stcopilotdemo[unique-suffix]' in Australia East region, in the resource group 'rg-mcp-workshop'
   ```
2. Review and execute the command that Copilot suggests
3. Verify the storage account was created by asking:
   ```
   List all storage accounts in the rg-mcp-workshop resource group
   ```

### Exercise 2.3: Working with Blob Containers

1. Ask Copilot to list containers in your storage account:
   ```
   List blob containers in storage account [your-account-name]
   ```
2. Create a new container:
   ```
   Create a new blob container named 'copilot-demo' in storage account [your-account-name]
   ```
3. Get container properties:
   ```
   Show me the properties and metadata of container 'copilot-demo' in storage account [your-account-name]
   ```

### Exercise 2.4: Managing Blobs

1. List blobs in the container:
   ```
   List all blobs in the container data for storage account [your-account-name]
   ```
2. Download the uploaded blob:
   ```
   Download the blobs to a local file
   ```

### Exercise 2.5: Working with Azure Tables

1. Ask Copilot to list tables in your storage account:
   ```
   List tables in storage account [your-account-name]
   ```
2. Create a new table:
   ```
   Create a new table named 'CopilotDemo' in storage account [your-account-name]
   ```
3. Note: Adding entities to tables requires using the Azure SDK libraries, which we'll explore conceptually:
   ```
   How can I add entities to an Azure Table?
   ```

## Challenge Exercise

Create a script that:

1. Creates a new container in your storage account
2. Uploads all JSON files from a local directory to this container
3. Lists all uploaded blobs with their sizes
4. Generates a shared access signature (SAS) URL for one of the blobs

Ask GitHub Copilot to help you create this script.

## Knowledge Check

1. How does Azure MCP help streamline storage account operations compared to traditional Azure CLI commands?
2. What are the key advantages of using Azure MCP for uploading large files to blob storage containers?
3. What are the limitations when using Azure MCP to manage Table Storage compared to Queue Storage?

## Next Steps

Proceed to [Module 3: Azure AI Search](../03-azure-ai-search/README.md) to learn how to work with search services and indexes.
