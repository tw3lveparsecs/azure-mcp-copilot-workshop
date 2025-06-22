# Dev Container Configuration

This dev container is configured to support the Azure MCP Copilot Workshop with the following features:

## Included Tools

- **Node.js 20**: Latest LTS version for running the Azure MCP server
- **Azure CLI**: For managing Azure resources
- **GitHub CLI**: For GitHub operations
- **Azure MCP Server**: Configured to run with `@azure/mcp@latest`

## VS Code Extensions

- TypeScript support
- JSON language support
- Azure Resource Groups extension
- Azure Account extension
- GitHub Copilot and Copilot Chat

## MCP Configuration

The Azure MCP server is pre-configured in the VS Code settings with:

```json
{
  "mcp.servers": {
    "azure": {
      "command": "npx",
      "args": [
        "-y",
        "@azure/mcp@latest",
        "server",
        "start"
      ]
    }
  }
}
```

## Getting Started

1. Open this repository in VS Code
2. When prompted, click "Reopen in Container" or use the Command Palette: `Remote-Containers: Reopen in Container`
3. Wait for the container to build and configure
4. The Azure MCP server will be available automatically
5. Authenticate with Azure using `az login` if needed

## Port Forwarding

- Port 3000: Application development
- Port 8080: MCP Server (configured for silent forwarding)

## Azure Authentication

Your local Azure CLI credentials will be mounted into the container for seamless authentication.
