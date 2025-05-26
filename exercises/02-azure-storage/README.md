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

### Exercise 2.2: Creating a Storage Account with Azure CLI

1. Ask GitHub Copilot to help you create a storage account:
   ```
   Help me create a new storage account named 'stcopilotdemo[unique-suffix]' in East US region, in the resource group 'rg-copilot-demo'
   ```
2. Review and execute the command that Copilot suggests
3. Verify the storage account was created by asking:
   ```
   List all storage accounts in the rg-copilot-demo resource group
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

1. Ask Copilot to upload a sample file (create a small text file first):
   ```
   How can I upload a local file to the 'copilot-demo' container in my storage account?
   ```
2. Use the suggested command to upload your file
3. List blobs in the container:
   ```
   List all blobs in the 'copilot-demo' container
   ```
4. Download the uploaded blob:
   ```
   Download the blob I just uploaded to a new local file
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

1. How does Azure MCP help with exploring storage account properties compared to using Azure Portal?
2. What are the key differences between blob storage and table storage?
3. How can you use Copilot to generate complex storage account queries?

## Next Steps

Proceed to [Module 3: Azure AI Search](../03-azure-ai-search/README.md) to learn how to work with search services and indexes.
