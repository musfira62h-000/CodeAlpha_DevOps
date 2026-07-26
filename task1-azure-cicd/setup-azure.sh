#!/usr/bin/env bash
# CodeAlpha Task 1 — create Azure resources (run in Azure Cloud Shell or local Azure CLI)
# Usage: bash setup-azure.sh
set -euo pipefail

RG="codealpha-devops-rg"
LOCATION="eastus"
ACR_NAME="codealphadevopsacr$RANDOM"   # ACR names must be globally unique
APP_NAME="codealpha-devops-web$RANDOM"
PLAN_NAME="codealpha-devops-plan"

echo "Resource group: $RG"
echo "ACR name:       $ACR_NAME"
echo "App name:       $APP_NAME"

az group create --name "$RG" --location "$LOCATION"

az acr create \
  --resource-group "$RG" \
  --name "$ACR_NAME" \
  --sku Basic \
  --admin-enabled true

az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RG" \
  --is-linux \
  --sku B1

az webapp create \
  --resource-group "$RG" \
  --plan "$PLAN_NAME" \
  --name "$APP_NAME" \
  --deployment-container-image-name nginx:alpine

# Allow App Service to pull from ACR
ACR_USER=$(az acr credential show -n "$ACR_NAME" --query username -o tsv)
ACR_PASS=$(az acr credential show -n "$ACR_NAME" --query passwords[0].value -o tsv)
ACR_SERVER=$(az acr show -n "$ACR_NAME" --query loginServer -o tsv)

az webapp config container set \
  --name "$APP_NAME" \
  --resource-group "$RG" \
  --docker-custom-image-name "$ACR_SERVER/codealpha-webserver:latest" \
  --docker-registry-server-url "https://$ACR_SERVER" \
  --docker-registry-server-user "$ACR_USER" \
  --docker-registry-server-password "$ACR_PASS"

echo ""
echo "=== Save these values for azure-pipelines.yml / Azure DevOps ==="
echo "resourceGroup:   $RG"
echo "acrName:         $ACR_NAME"
echo "containerRegistry: $ACR_SERVER"
echo "appServiceName:  $APP_NAME"
echo "App URL:         https://$APP_NAME.azurewebsites.net"
