# Task 4 — Web Server using Docker

Deploy and manage a simple Nginx web server inside a Docker container.

## What’s included

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds an Nginx Alpine image with our site |
| `nginx.conf` | Server config + `/health` endpoint |
| `html/` | Static website served by the container |

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/Mac) **or** Docker Engine on Linux/Ubuntu

## Quick start

```bash
cd task4-docker-webserver

# Build the image
docker build -t codealpha-webserver .

# Run the container (host port 8080 → container port 80)
docker run -d --name codealpha-web -p 8080:80 codealpha-webserver

# Open in browser
# http://localhost:8080
```

## Useful Docker commands (lifecycle)

```bash
# List running containers
docker ps

# View logs
docker logs codealpha-web

# Check health
docker inspect --format='{{.State.Health.Status}}' codealpha-web
curl http://localhost:8080/health

# Stop / start / remove
docker stop codealpha-web
docker start codealpha-web
docker rm -f codealpha-web

# Remove image
docker rmi codealpha-webserver
```

## What this covers (CodeAlpha)

- Docker containerization basics  
- Deploy a web server in a container  
- Container lifecycle (`build`, `run`, `ps`, `logs`, `stop`, `rm`)  
- Health check + simple troubleshooting  

## Screenshots to take for submission

1. `docker build` success  
2. `docker ps` showing the running container  
3. Browser open at `http://localhost:8080`  
4. `docker logs` or `/health` response  

---

**Intern:** Musfira Hassan · CodeAlpha DevOps
