# This project targets Microsoft Fabric hosting.
# Azure CLI deployment does NOT apply — publish via the Fabric portal or the
# VS Code Fabric extension instead. See README.md.
Write-Host "This is a Fabric User Data Functions project. Publish from the Fabric portal or the VS Code Fabric extension, not via Azure CLI." -ForegroundColor Yellow

# ---- Configuration (edit as needed) ----
$RandomSuffix     = -join ((97..122) | Get-Random -Count 6 | ForEach-Object { [char]$_ })
$Location         = "eastus"
$ResourceGroup    = "rg-proj1"
$StorageAccount   = "stproj1$RandomSuffix"          # 3-24 lowercase alphanumeric
$FunctionApp      = "func-proj1-$RandomSuffix"
$PythonVersion    = "3.11"
$FunctionsVersion = "4"

Write-Host "Using suffix: $RandomSuffix" -ForegroundColor Cyan

# ---- Resource group ----
az group create `
    --name $ResourceGroup `
    --location $Location

# ---- Storage account (required by Functions) ----
az storage account create `
    --name $StorageAccount `
    --resource-group $ResourceGroup `
    --location $Location `
    --sku Standard_LRS `
    --allow-blob-public-access false

# ---- Function app (Linux Consumption plan) ----
az functionapp create `
    --name $FunctionApp `
    --resource-group $ResourceGroup `
    --storage-account $StorageAccount `
    --consumption-plan-location $Location `
    --runtime python `
    --runtime-version $PythonVersion `
    --functions-version $FunctionsVersion `
    --os-type Linux

# ---- App settings ----
az functionapp config appsettings set `
    --name $FunctionApp `
    --resource-group $ResourceGroup `
    --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

# ---- Publish the code (run from the project directory) ----
func azure functionapp publish $FunctionApp --python

Write-Host "Deployment complete. Function app: $FunctionApp" -ForegroundColor Green
