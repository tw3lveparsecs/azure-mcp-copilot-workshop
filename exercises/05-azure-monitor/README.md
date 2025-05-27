# Module 5: Azure Monitor

This module focuses on using GitHub Copilot with Azure MCP to work with Azure Monitor, specifically Log Analytics workspaces and Kusto Query Language (KQL).

## Learning Objectives

- List and explore Log Analytics workspaces
- Write and execute KQL queries
- Analyze logs using KQL
- Explore available monitoring tables

## Prerequisites

- Completed Module 4: Azure Cosmos DB
- Log Analytics workspace created (either manually or via the setup script)

## Exercises

### Exercise 5.1: Listing Log Analytics Workspaces

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your Log Analytics workspaces using Azure MCP:
   ```
   List all my Log Analytics workspaces using Azure MCP
   ```
3. Get details about a specific workspace:
   ```
   Show me details about the Log Analytics workspace [your-workspace-name]
   ```

### Exercise 5.2: Creating a Log Analytics Workspace with Azure MCP

1. Ask GitHub Copilot to help you create a Log Analytics workspace:
   ```
   Help me create a new Log Analytics workspace named 'log-copilot-demo' in Australia East region in the resource group 'rg-mcp-workshop'
   ```
2. Review and execute the command that Copilot suggests
3. Verify the workspace was created by asking:
   ```
   List all Log Analytics workspaces in my subscription
   ```

### Exercise 5.3: Exploring Available Tables

1. Ask Copilot to list available tables in your workspace:
   ```
   List available tables in Log Analytics workspace [your-workspace-name]
   ```
2. Get schema information about a specific table:
   ```
   Show me the schema for the SecurityEvent table in workspace [your-workspace-name]
   ```
   Note: If the SecurityEvent table doesn't exist in your workspace, try another table like Heartbeat or AzureActivity.

### Exercise 5.4: Writing KQL Queries

1. Ask Copilot to help you write a basic KQL query:
   ```
   Help me write a KQL query to get the most recent 10 events from the Heartbeat table
   ```
2. Execute the query using Azure MCP or Azure CLI
3. Try a more complex query:
   ```
   Write a KQL query to count events by computer name in the Heartbeat table for the last 24 hours
   ```

### Exercise 5.5: Analysing Logs with KQL

1. Ask Copilot to help you analyze logs:
   ```
   How can I use KQL to find errors in my logs?
   ```
2. Learn about visualising data:
   ```
   How can I visualise time-series data using KQL?
   ```

## Challenge Exercise

Create a script that:

1. Create Azure resources that connects to a Log Analytics workspace
2. Runs multiple KQL queries to analyse different aspects of your environment
3. Saves the results to JSON files for further analysis

Ask GitHub Copilot to help you create this script.

## Knowledge Check

1. How does Azure MCP help with exploring Log Analytics workspaces compared to using Azure Portal?
2. What are the basic components of a KQL query?
3. How can you optimise KQL queries for better performance?

## Next Steps

Proceed to [Module 6: Azure Key Vault](../06-key-vault/README.md) to learn how to work with keys, secrets, and certificates.
