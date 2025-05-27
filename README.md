# GitHub Copilot with Azure MCP Workshop

This workshop provides hands-on experience with GitHub Copilot and the Azure Model Context Protocol (MCP) Server to interact with various Azure resources. Participants will learn how to use natural language queries, utilise GitHub Copilot's AI-powered capabilities, and leverage the Azure MCP Server to effectively manage Azure resources.

## What is Azure MCP?

Azure MCP (Model Context Protocol) Server implements the [MCP specification](https://modelcontextprotocol.io) to create a seamless connection between AI agents (like GitHub Copilot) and key Azure services including Azure Storage, Cosmos DB, Azure AI Search, Azure Monitor, Key Vault, and more.

Architecturally, it allows GitHub Copilot to process natural language queries and interact with Azure resources without needing to remember complex CLI commands or navigate through the Azure Portal. See the [architecture diagram](docs/architecture-diagram.md) for a visual representation of how these components interact.

## Workshop Structure

This workshop is divided into six main modules:

1. **Resource Groups**: Learn how to list and manage Azure resource groups
2. **Azure Storage**: Explore storage accounts, containers, blobs, and tables
3. **Azure AI Search**: Work with search services, indexes, and queries
4. **Azure Cosmos DB**: Manage databases, containers, items, and execute queries
5. **Azure Monitor**: Explore Log Analytics workspaces and query logs using KQL
6. **Azure Key Vault**: List, create, and manage keys in Azure Key Vault

## Prerequisites

Before starting the workshop, ensure you have:

- Visual Studio Code installed ([Download](https://code.visualstudio.com/download))
- GitHub Copilot and GitHub Copilot Chat extensions installed
- Node.js 20 or later installed ([Download](https://nodejs.org/en/download))
- Azure CLI installed ([Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli))
- An active Azure account with appropriate permissions
- Azure MCP Server installed (Instructions included in the workshop)

## Getting Started

1. Clone this repository
2. Follow the setup instructions in [docs/setup-guide.md](docs/setup-guide.md)
3. Start with the first exercise in the [exercises](exercises) directory

## Workshop Overview

See [docs/workshop-overview.md](docs/workshop-overview.md) for a detailed overview of what you'll learn in this workshop.

## Resources

- [Azure MCP GitHub Repository](https://github.com/Azure/azure-mcp)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/)
- [Model Context Protocol](https://modelcontextprotocol.io)
