# Module 4: Azure Cosmos DB

This module focuses on using GitHub Copilot with Azure MCP to work with Azure Cosmos DB accounts, databases, containers, and items.

## Learning Objectives

- List and explore Azure Cosmos DB accounts
- Manage databases and containers
- Insert and query items in Cosmos DB
- Execute SQL queries against containers

## Prerequisites

- Completed Module 3: Azure AI Search
- Azure Cosmos DB account created (either manually or via the setup script)

## Exercises

### Exercise 4.1: Listing Azure Cosmos DB Accounts

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your Cosmos DB accounts using Azure MCP:
   ```
   List all my Azure Cosmos DB accounts using Azure MCP
   ```
3. Get details about a specific Cosmos DB account:
   ```
   Show me details about the Cosmos DB account [your-account-name]
   ```

### Exercise 4.2: Creating a Cosmos DB Account with Azure CLI

1. Ask GitHub Copilot to help you create a Cosmos DB account:
   ```
   Help me create a new Azure Cosmos DB account named 'cosmos-copilot-demo' in East US region in the resource group 'rg-copilot-demo' with the SQL API
   ```
2. Review and execute the command that Copilot suggests
3. Verify the account was created by asking:
   ```
   List all Cosmos DB accounts in my subscription
   ```

### Exercise 4.3: Managing Databases and Containers

1. Ask Copilot to list databases in your Cosmos DB account:
   ```
   List all databases in the Cosmos DB account [your-account-name]
   ```
2. Create a new database:
   ```
   Create a new database named 'CopilotWorkshopDB' in the Cosmos DB account [your-account-name]
   ```
3. Create a container within the database:
   ```
   Create a new container named 'Products' with partition key '/category' in the database 'CopilotWorkshopDB'
   ```
4. List all containers in the database:
   ```
   List all containers in the database 'CopilotWorkshopDB'
   ```

### Exercise 4.4: Working with Items

1. Ask Copilot how to add items to a Cosmos DB container:
   ```
   How can I add items to the 'Products' container in my Cosmos DB database?
   ```
2. Based on Copilot's guidance, create and execute a command to add an item:
   ```
   Add an item to the 'Products' container with id '1', name 'Laptop', category 'Electronics', price 999.99
   ```
3. Add more items with different categories
4. List items in the container:
   ```
   List all items in the 'Products' container
   ```

### Exercise 4.5: Executing SQL Queries

1. Ask Copilot how to query items in Cosmos DB:
   ```
   How can I execute a SQL query against my Cosmos DB container?
   ```
2. Execute a simple query:
   ```
   Query the 'Products' container for items with category 'Electronics'
   ```
3. Try a more complex query:
   ```
   Query the 'Products' container for items with price greater than 500 and sort by price descending
   ```

## Challenge Exercise

Create a script that:

1. Creates a new container in your Cosmos DB database
2. Adds multiple items from a JSON file to this container
3. Executes a SQL query with aggregation (e.g., average price by category)
4. Outputs the results to a file

Ask GitHub Copilot to help you create this script.

## Knowledge Check

1. How does Azure MCP help with exploring Cosmos DB compared to using Azure Portal?
2. What are the key differences between containers and items in Cosmos DB?
3. How can you optimize SQL queries in Cosmos DB?

## Next Steps

Proceed to [Module 5: Azure Monitor](../05-azure-monitor/README.md) to learn how to work with Log Analytics workspaces and query logs using KQL.
