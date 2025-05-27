# Module 6: Azure Key Vault

This module focuses on using GitHub Copilot with Azure MCP to work with Azure Key Vault for secure key and secret management.

## Learning Objectives

- List and explore Azure Key Vaults
- Create and manage keys
- Work with secrets
- Implement security best practices

## Prerequisites

- Completed Module 5: Azure Monitor
- Azure Key Vault created (either manually or via the setup script)

## Exercises

### Exercise 6.1: Listing Azure Key Vaults

1. Open GitHub Copilot Chat in VS Code
2. Ask Copilot to list your Key Vaults using Azure MCP:
   ```
   List all my Azure Key Vaults using Azure MCP
   ```
3. Get details about a specific Key Vault:
   ```
   Show me details about the Key Vault [your-key-vault-name]
   ```

### Exercise 6.2: Creating a Key Vault with Azure MCP

1. Ask GitHub Copilot to help you create a Key Vault:
   ```
   Help me create a new Azure Key Vault named 'kv-copilot-demo' in Australia East region in the resource group 'rg-mcp-workshop'
   ```
2. Review and execute the command that Copilot suggests
3. Verify the Key Vault was created by asking:
   ```
   List all Key Vaults in my subscription
   ```

### Exercise 6.3: Working with Keys

1. Ask Copilot to list keys in your Key Vault:
   ```
   List all keys in the Key Vault [your-key-vault-name]
   ```
2. Create a new key:
   ```
   Create a new RSA key named 'CopilotDemoKey' in the Key Vault [your-key-vault-name]
   ```
3. Get details about the key:
   ```
   Show me details about the key 'CopilotDemoKey' in Key Vault [your-key-vault-name]
   ```

### Exercise 6.4: Working with Secrets

1. Ask Copilot to help you add a secret to the Key Vault:
   ```
   Add a secret named 'DbConnectionString' with value 'Server=myserver;Database=mydb;User Id=admin;Password=mypassword123' to Key Vault [your-key-vault-name]
   ```
2. List all secrets:
   ```
   List all secrets in the Key Vault [your-key-vault-name]
   ```
3. Retrieve a secret (note: the value will be redacted in most cases for security):
   ```
   Get the secret 'DbConnectionString' from the Key Vault [your-key-vault-name]
   ```

## Challenge Exercise

Create a script that:

1. Creates a new Key Vault
2. Adds multiple secrets from a configuration file
3. Creates a key for encryption
4. Outputs the vault information to a secure file

Ask GitHub Copilot to help you create this script.

## Knowledge Check

1. How does Azure MCP help with managing Key Vault compared to using Azure Portal?
2. What are the key differences between keys, secrets, and certificates in Key Vault?
3. What best practices should be followed when working with Key Vault?

## Workshop Completion

Congratulations on completing all six modules of the GitHub Copilot with Azure MCP Workshop! You've learned how to:

- Use GitHub Copilot with Azure MCP to interact with various Azure resources
- Create and manage resources using natural language queries
- Execute complex operations with AI assistance
- Navigate Azure services efficiently

### Next Steps

1. Clean up your resources using the teardown script in the scripts directory
2. Explore more complex scenarios with Azure MCP and GitHub Copilot
3. Implement what you've learned in your own projects

Thank you for participating in this workshop!
