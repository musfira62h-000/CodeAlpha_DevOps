# Task 1 — Azure CI/CD Progress Log

**Intern:** Musfira Hassan  
**Domain:** DevOps · CodeAlpha  
**Subscription:** Azure for Students  

---

## Resources created

| Resource | Name | Details |
|----------|------|---------|
| Resource Group (ACR) | `codealpha-devops-rg` | Central India |
| Azure Container Registry | `codealphacr15128` | Login: `codealphacr15128.azurecr.io` · Admin enabled |
| Resource Group (Web App) | `codealpha-devops-rg2` | Used because B1 had no capacity in original RG |
| App Service Plan | `ASP-codealphadevopsrg2-9b83` | Linux · **Free F1** · Central India |
| Web App | `codealphaweb15128` | Status: **Running** · Publish: Container |
| Default URL | `https://codealphaweb15128-bsbfcadraghjg9ft.centralindia-01.azurewebsites.net` | Central India |

> Note: App Service **B1** failed in `codealpha-devops-rg` due to regional capacity. Creating a **new resource group** + **Free F1** succeeded (as suggested by Azure).

---

## Screenshot — Web App deployment complete

Azure Portal showed a successful deployment for the Web App in resource group `codealpha-devops-rg2`.

![Web App deployment complete](./screenshots/01_webapp_deployment_complete.png)

**Figure 1:** Deployment complete — Subscription: Azure for Students · Resource group: `codealpha-devops-rg2` · Start time: 7/26/2026, 4:16:26 PM.

## Screenshot — Web App overview (Running)

![Web App overview](./screenshots/02_webapp_overview_running.png)

**Figure 2:** Web App `codealphaweb15128` — Running · Central India · Plan F1 · Container publish.

---

## Screenshot — Azure DevOps organization

Organization created: **musfira-codealpha** (Create a project screen).

![Azure DevOps create project](./screenshots/03_azure_devops_create_project.png)

**Figure 3:** Azure DevOps org `musfira-codealpha` — ready to create project.

---

## Next steps

1. ~~Confirm Web App name and URL~~ ✅  
2. ~~Create Azure DevOps organization~~ ✅ `musfira-codealpha`  
3. Create project `CodeAlpha-DevOps` + pipeline  
4. Service connections: `acr-connection` + Azure Resource Manager  
5. Pipeline builds `task4-docker-webserver` → pushes to ACR → deploys to App Service  

> Note: Free **F1** may limit custom container pulls from ACR. If deploy fails, keep CI as build+push to ACR and upgrade plan to B1 when capacity is available.

---

## Pipeline variable values to use

```yaml
acrLoginServer: 'codealphacr15128.azurecr.io'
imageName: 'codealpha-webserver'
appServiceName: 'codealphaweb15128'
```

## Screenshot — Azure DevOps project created

Project: **CodeAlpha-DevOps** in org **musfira-codealpha**.

![Project home](./screenshots/04_azure_devops_project_home.png)

**Figure 4:** Azure DevOps project home — CodeAlpha-DevOps (Private).


## Screenshot — Pipeline configure

Chose configuration templates screen (Connect → Select → Configure).

![Configure pipeline](./screenshots/05_pipeline_configure.png)

**Figure 5:** Configure your pipeline — select Existing Azure Pipelines YAML file.

## Screenshot — Select existing YAML

![Select YAML](./screenshots/06_select_existing_yaml.png)

**Figure 6:** Branch `main` · Path `/task1-azure-cicd/azure-pipelines.simple.yml` · Repo musfira62h-000/CodeAlpha_DevOps.


## Screenshot — Review pipeline YAML

![Review YAML](./screenshots/07_pipeline_review_yaml.png)

**Figure 7:** Review pipeline YAML — `azure-pipelines.simple.yml` with ACR `codealphacr15128` and App `codealphaweb15128`.


## Screenshot — ACR service connection

![acr-connection](./screenshots/08_acr_connection_created.png)

**Figure 8:** Service connection `acr-connection` (Docker Registry / service principal) created by Musfira Hassan.


## Screenshot — Service connections ready

![Service connections](./screenshots/09_service_connections_ready.png)

**Figure 9:** `acr-connection` (Docker Registry) and `CodeAlpha-Azure-Connection` (Azure Resource Manager) configured.


## Screenshot — Pipeline run started

![Pipeline run](./screenshots/10_pipeline_run_started.png)

**Figure 10:** Pipeline run `#20260726.1` — Set up CI with Azure Pipelines (in progress / summary).


## Screenshot — Pipeline succeeded

![Pipeline succeeded](./screenshots/11_pipeline_succeeded.png)

**Figure 11:** Pipeline run succeeded (~1m 41s). Minor warning on Build and push to ACR output file (non-blocking).

