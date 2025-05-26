```mermaid
graph TD
    A[GitHub Copilot] -->|Processes natural language query| B[GitHub Copilot Agent]
    B -->|Selects tool| C[Azure MCP Server]
    C -->|Communicates with| D[Azure CLI]
    C -->|Communicates with| E[Azure SDKs]
    D -->|Manages| F[Azure Resources]
    E -->|Manages| F
    F -->|Returns data| C
    C -->|Formats response| B
    B -->|Presents results| A

    subgraph "Azure Resources"
    G[Resource Groups]
    H[Storage Accounts]
    I[Cosmos DB]
    J[Azure AI Search]
    K[Log Analytics]
    L[Key Vault]
    end

    F --- G
    F --- H
    F --- I
    F --- J
    F --- K
    F --- L

    classDef azure fill:#0072C6,stroke:#0072C6,color:white;
    classDef github fill:#2B3137,stroke:#2B3137,color:white;
    classDef mcp fill:#5E5E5E,stroke:#5E5E5E,color:white;

    class A,B github;
    class C,D,E mcp;
    class F,G,H,I,J,K,L azure;
```

# Azure MCP and GitHub Copilot Architecture

This diagram illustrates the flow of information between GitHub Copilot, the Azure MCP Server, and Azure resources.

1. The user enters a natural language query in GitHub Copilot
2. GitHub Copilot Agent processes the query and selects Azure MCP as the appropriate tool
3. Azure MCP Server receives the command and uses Azure CLI or Azure SDKs to interact with Azure resources
4. Azure resources return the requested data
5. Azure MCP formats the response into structured data
6. GitHub Copilot Agent presents the results to the user in a human-readable format

The architecture enables users to manage Azure resources through natural language queries without having to remember complex CLI commands or navigate through the Azure Portal.
