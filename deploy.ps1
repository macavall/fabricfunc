# =============================================================================
# Azure environment build for hosting a Python Functions app (Azure CLI).
#
# NOTE ON FABRIC:
#   function_app.py imports `fabric.functions` (Microsoft Fabric User Data
#   Functions SDK). That runtime only executes INSIDE Microsoft Fabric and will
#   NOT run on Azure Functions. This script provisions an Azure Functions
#   HOSTING ENVIRONMENT (per the request to build it with Azure CLI). To run the
#   sample as-is, publish to Fabric instead (see README.md). To host on Azure
#   Functions, port the code to the `azure.functions` programming model first.
#
# Best practices applied:
#   - Flex Consumption plan (FC1) on Linux for Python  (not Y1 dynamic)
#   - Application Insights enabled
#   - Storage hardened (no public blob access, TLS 1.2)
# =============================================================================

$ErrorActionPreference = "Stop"

# ---- Configuration (edit as needed) ----
$RandomSuffix   = -join ((97..122) | Get-Random -Count 6 | ForEach-Object { [char]$_ })
$Location       = "eastus"
$ResourceGroup  = "rg-proj1-fabricfunc"
$StorageAccount = "stproj1$RandomSuffix"          # 3-24 lowercase alphanumeric
$FunctionApp    = "func-proj1-$RandomSuffix"
$AppInsights    = "appi-proj1-$RandomSuffix"
$PythonVersion  = "3.11"
$InstanceMemory = 2048                            # MB

Write-Host "Using suffix: $RandomSuffix" -ForegroundColor Cyan

# ---- Resource group ----
az group create --name $ResourceGroup --location $Location -o table

# ---- Storage account (required by Functions) ----
az storage account create `
    --name $StorageAccount `
    --resource-group $ResourceGroup `
    --location $Location `
    --sku Standard_LRS `
    --allow-blob-public-access false `
    --min-tls-version TLS1_2 -o table

# ---- Application Insights ----
az monitor app-insights component create `
    --app $AppInsights `
    --location $Location `
    --resource-group $ResourceGroup `
    --application-type web -o table

# ---- Function app (Flex Consumption, Linux, Python) ----
az functionapp create `
    --name $FunctionApp `
    --resource-group $ResourceGroup `
    --storage-account $StorageAccount `
    --flexconsumption-location $Location `
    --runtime python `
    --runtime-version $PythonVersion `
    --instance-memory $InstanceMemory `
    --app-insights $AppInsights `
    --configure-networking-later true -o table

# ---- App settings ----
az functionapp config appsettings set `
    --name $FunctionApp `
    --resource-group $ResourceGroup `
    --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing" -o table

Write-Host "Environment ready. Function app: https://$FunctionApp.azurewebsites.net" -ForegroundColor Green
Write-Host "To publish Fabric-compatible code, use the Fabric portal/extension (see README.md)." -ForegroundColor Yellow

# ---- Publish code (only if ported to the azure.functions model) ----
# func azure functionapp publish $FunctionApp --python
