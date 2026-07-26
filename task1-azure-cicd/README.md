# Task 1 — CI/CD Pipeline using Azure

Automated CI/CD that:

1. Builds the **Task 4 Docker web server** image  
2. Pushes it to **Azure Container Registry (ACR)**  
3. Deploys it to **Azure App Service** (Web App for Containers)

## Architecture

```
GitHub (this repo)
   └─ push to main
         └─ Azure Pipelines
               ├─ docker build (task4-docker-webserver)
               ├─ push → Azure Container Registry
               └─ deploy → Azure App Service
```

## Prerequisites

- Azure subscription (you have this)  
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) **or** Azure Cloud Shell  
- [Azure DevOps](https://dev.azure.com) organization + project  
- This GitHub repo connected to Azure Pipelines  

## Step A — Create Azure resources

### Option 1: Script (Cloud Shell)

```bash
# In https://shell.azure.com  (Bash)
az login   # if needed
bash task1-azure-cicd/setup-azure.sh
```

Copy the printed `acrName`, `appServiceName`, and App URL.

### Option 2: Portal (manual)

1. Create Resource Group: `codealpha-devops-rg`  
2. Create **Container Registry** (Basic SKU), enable Admin user  
3. Create **App Service** → Linux → **Web App for Containers**  
4. Note ACR login server (`*.azurecr.io`) and App name  

## Step B — Azure DevOps connections

1. Go to **Azure DevOps → Project Settings → Service connections**  
2. Create **Docker Registry** connection → Azure Container Registry → name it `acr-connection`  
3. Create **Azure Resource Manager** connection → name it `CodeAlpha-Azure-Connection`  

## Step C — Create the pipeline

1. **Pipelines → New pipeline → GitHub** → select `CodeAlpha_DevOps`  
2. Choose **Existing Azure Pipelines YAML file**  
3. Path: `/task1-azure-cicd/azure-pipelines.simple.yml` (easiest start)  
4. Edit YAML variables to match **your** ACR and App Service names  
5. **Run** the pipeline  

Or use `azure-pipelines.yml` for the staged Build → Deploy version (same variable updates).

## Step D — Update YAML names

In `azure-pipelines.simple.yml` set:

```yaml
acrLoginServer: 'YOUR_ACR.azurecr.io'
# appName: 'YOUR_APP_NAME'
```

And ensure service connection names match Step B.

## Step E — Verify

- Pipeline run is **green**  
- Image appears in ACR → Repositories  
- Open `https://YOUR_APP_NAME.azurewebsites.net` — CodeAlpha Docker page loads  

## Monitoring

- Azure DevOps → Pipelines → run history / logs  
- Azure Portal → App Service → Log stream / Deployment Center  
- ACR → Repositories → tags (`latest`, build id)  

## Screenshots for CodeAlpha submission

1. Green Azure Pipeline run  
2. Image tags in ACR  
3. App Service overview + live site URL  
4. Browser showing the deployed web page  

## Files

| File | Purpose |
|------|---------|
| `azure-pipelines.simple.yml` | Single-job CI/CD (recommended first) |
| `azure-pipelines.yml` | Multi-stage Build + Deploy |
| `setup-azure.sh` | Creates RG, ACR, App Service Plan, Web App |

---

**Intern:** Musfira Hassan · CodeAlpha DevOps  
**Related:** [`../task4-docker-webserver`](../task4-docker-webserver)
