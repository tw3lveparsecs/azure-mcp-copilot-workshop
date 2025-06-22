# GitHub Copilot with Azure MCP Workshop

As part of the GitHub Copilot Global Bootcamp presented on June 17th 2025, (presentation can be found [here](docs/turn-github-copilot-into-your-ultimate-azure-sidekick.pdf)), this workshop provides hands-on experience with GitHub Copilot and the Azure Model Context Protocol (MCP) Server to interact with various Azure resources. Participants will learn how to use natural language queries, utilise GitHub Copilot's AI-powered capabilities, and leverage the Azure MCP Server to effectively manage Azure resources.

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

## Dev Container Setup

This repository includes a preconfigured development container that automatically sets up the workshop environment.

### Terminal Notifications on Codespace Load

When the codespace or dev container loads, a terminal opens indicating command `npx -y @azure/mcp@latest server start` is running.

These notifications appear automatically due to the `postStartCommand` configuration in the devcontainer.json file.

This is expected behaviour and indicates that the Azure MCP server is started and running and ready to use.

You can open GitHub Copilot Chat and start interacting with Azure resources using natural language queries.

### Devcontainer Configuration Details

The container is configured via `.devcontainer/devcontainer.json` with:

#### Base Image

```json
{
  "name": "Azure MCP Copilot Workshop",
  "image": "mcr.microsoft.com/devcontainers/javascript-node:1-20-bullseye"
}
```

#### Features

- **Azure CLI** (`ghcr.io/devcontainers/features/azure-cli:1`): Pre-installed for Azure resource management

#### VS Code Extensions

Automatically installed extensions:

- `GitHub.copilot` - GitHub Copilot AI assistant
- `GitHub.copilot-chat` - GitHub Copilot Chat interface

#### MCP Server Configuration

The Azure MCP server is pre-configured in VS Code settings:

```json
{
  "mcp": {
    "servers": {
      "azure-mcp-server": {
        "command": "npx",
        "args": ["-y", "@azure/mcp@latest", "server", "start"]
      }
    }
  }
}
```

#### Post-Start Command

Automatically runs on container startup:

```bash
npx -y @azure/mcp@latest server start
```

### What Happens When You Open the Codespace

1. **Container loads** with Node.js 20 and Azure CLI pre-installed
2. **Extensions install** automatically (GitHub Copilot & Copilot Chat)
3. **MCP server starts** via the post-start command
4. **Terminal shows** confirmation notifications
5. **Ready to use** - Workshop environment is fully configured

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
