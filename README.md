# CodeAlpha_DevOps

DevOps internship tasks for **CodeAlpha**.

## Intern

- **Name:** Musfira Hassan  
- **Domain:** DevOps  
- **Organization:** CodeAlpha  

---

## Completed / in progress

| Task | Title | Folder | Status |
|------|--------|--------|--------|
| **1** | CI/CD Pipeline using Azure | [`task1-azure-cicd/`](./task1-azure-cicd) | Ready to configure in Azure |
| 2 | Jenkins Remoting Project | â€” | Not started |
| 3 | Java Application using Gradle | â€” | Not started |
| **4** | Web Server using Docker | [`task4-docker-webserver/`](./task4-docker-webserver) | Ready (install Docker to run) |

You need **any 2 or 3** tasks for the certificate. This repo targets **Task 1 + Task 4**.

---

## Task 4 â€” Web Server using Docker

Nginx static site packaged in Docker.

```bash
cd task4-docker-webserver
docker build -t codealpha-webserver .
docker run -d --name codealpha-web -p 8080:80 codealpha-webserver
# open http://localhost:8080
```

Full guide: [`task4-docker-webserver/README.md`](./task4-docker-webserver/README.md)

---

## Task 1 â€” CI/CD Pipeline using Azure

Pipeline builds the Task 4 image, pushes to **Azure Container Registry**, deploys to **Azure App Service**.

1. Create Azure resources (`setup-azure.sh` or Portal)  
2. Connect GitHub repo in Azure DevOps  
3. Add service connections: `acr-connection` + `CodeAlpha-Azure-Connection`  
4. Run pipeline from `task1-azure-cicd/azure-pipelines.simple.yml`  

Full guide: [`task1-azure-cicd/README.md`](./task1-azure-cicd/README.md)

---

## Repo contents

- `task4-docker-webserver/` â€” Docker web server  
- `task1-azure-cicd/` â€” Azure Pipelines + setup script  

---

Internship reference: [codealpha.tech](https://www.codealpha.tech)
