# Module 3: Azure AI Search

This module focuses on using GitHub Copilot with Azure MCP to work with Azure AI Search services, indexes, and queries.

## Learning Objectives

- List and explore Azure AI Search services
- Examine search index schema and configuration
- Perform search queries against indexes
- Understand how to optimize search for different scenarios

## Prerequisites

- Completed Module 2: Azure Storage
- Azure AI Search service created (either manually or via the setup script)

## Exercises

### Exercise 3.1: Listing Azure AI Search Services

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your Azure AI Search services using Azure MCP:
   ```
   List all my Azure AI Search services using Azure MCP
   ```
3. Get details about a specific search service:
   ```
   Show me details about the search service [your-search-service-name]
   ```

### Exercise 3.2: Creating a Search Service with Azure CLI

1. Ask GitHub Copilot to help you create a search service:
   ```
   Help me create a new Azure AI Search service named 'search-copilot-demo' in East US region in the resource group 'rg-copilot-demo' with the free tier (or basic if free isn't available)
   ```
2. Review and execute the command that Copilot suggests
3. Verify the service was created by asking:
   ```
   List all search services in my subscription
   ```

### Exercise 3.3: Exploring Search Indexes

1. If you have existing indexes in your search service, ask Copilot to list them:
   ```
   List all search indexes in [your-search-service-name]
   ```
2. If you don't have any indexes, we'll need to create one. Let's first understand the process:
   ```
   How can I create an index in my Azure AI Search service? Can you show me an example?
   ```
3. For creating an index, Azure REST API is typically used. Ask Copilot for guidance:
   ```
   Help me create a REST API request to create a simple index called 'hotels' with fields for hotelId, hotelName, description, and category
   ```

### Exercise 3.4: Querying Search Indexes

1. If you have an existing index with data, query it using Azure MCP:
   ```
   Help me query the index [your-index-name] in search service [your-search-service-name]
   ```
2. Try different query parameters:
   ```
   Search for 'beach' in the [your-index-name] index with a filter on category
   ```
3. If you don't have data in your index, let's understand how to add documents:
   ```
   How can I add sample documents to my search index using REST API?
   ```

### Exercise 3.5: Understanding Index Schema and Configuration

1. Ask Copilot to explain a search index schema:
   ```
   Explain what makes a good search index schema design for a product catalog
   ```
2. Learn about search analyzers:
   ```
   What are search analyzers in Azure AI Search and how do I choose the right one?
   ```

## Challenge Exercise

Design a search solution for an e-commerce scenario:

1. Define an index schema for products with appropriate fields
2. Include suggestions, facets, and scoring profiles
3. Create sample queries for common search scenarios (filtering, sorting)

Ask GitHub Copilot to help you design this solution.

## Knowledge Check

1. How does Azure MCP help with exploring search service properties compared to using Azure Portal?
2. What are the key components of an Azure AI Search index?
3. How can you optimize search results for relevance?

## Next Steps

Proceed to [Module 4: Azure Cosmos DB](../04-cosmos-db/README.md) to learn how to work with databases, containers and items.
