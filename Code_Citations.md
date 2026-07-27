# Code Citations

## License: MIT
https://github.com/MicrosoftDocs/azure-docs/blob/80a221eea5c7efd322b4402f7db8cf113575d01f/articles/azure-functions/functions-reference-python.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingS
```


## License: MIT
https://github.com/copdips/copdips.github.io/blob/3b75ba755dbfae81fc302892654599e05c33553c/docs/posts/2024/2024-02-14-debugging-in-vscode.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingS
```


## License: MIT
https://github.com/MicrosoftDocs/azure-docs/blob/80a221eea5c7efd322b4402f7db8cf113575d01f/articles/azure-functions/functions-reference-python.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingSettings": {
        "isEnabled": true,
        "excludedTypes": "Request"
      }
    }
  },
  "extensionB
```


## License: MIT
https://github.com/copdips/copdips.github.io/blob/3b75ba755dbfae81fc302892654599e05c33553c/docs/posts/2024/2024-02-14-debugging-in-vscode.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingSettings": {
        "isEnabled": true,
        "excludedTypes": "Request"
      }
    }
  },
  "extensionB
```


## License: MIT
https://github.com/MicrosoftDocs/azure-docs/blob/80a221eea5c7efd322b4402f7db8cf113575d01f/articles/azure-functions/functions-reference-python.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingSettings": {
        "isEnabled": true,
        "excludedTypes": "Request"
      }
    }
  },
  "extensionBundle": {
    "id": "Microsoft.Azure.Functions.ExtensionBundle",
    "version": "[4.*, 5.0.0)"
  }
}
````

### c:\Users\macavall\tempProjects\fabric\proj1\README.md

Add a de
```


## License: MIT
https://github.com/copdips/copdips.github.io/blob/3b75ba755dbfae81fc302892654599e05c33553c/docs/posts/2024/2024-02-14-debugging-in-vscode.md

```
I'll add an Azure CLI deployment script and supporting infrastructure files.

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1

Azure CLI script that provisions all resources needed to host the Python function app and deploys it.

````powershell
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.ps1
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (`az`), Azure Functions Core Tools (`func`), logged in via `az login`.

$ErrorActionPreference = "Stop"

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
````

### c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh

Bash equivalent for macOS/Linux/WSL users.

````bash
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\deploy.sh
#!/usr/bin/env bash
# Deploys the Python function app to Azure using the Azure CLI.
# Prerequisites: Azure CLI (az), Azure Functions Core Tools (func), logged in via `az login`.
set -euo pipefail

# ---- Configuration (edit as needed) ----
RANDOM_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z' | head -c 6)
LOCATION="eastus"
RESOURCE_GROUP="rg-proj1"
STORAGE_ACCOUNT="stproj1${RANDOM_SUFFIX}"
FUNCTION_APP="func-proj1-${RANDOM_SUFFIX}"
PYTHON_VERSION="3.11"
FUNCTIONS_VERSION="4"

echo "Using suffix: ${RANDOM_SUFFIX}"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --allow-blob-public-access false

az functionapp create \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --consumption-plan-location "$LOCATION" \
  --runtime python \
  --runtime-version "$PYTHON_VERSION" \
  --functions-version "$FUNCTIONS_VERSION" \
  --os-type Linux

az functionapp config appsettings set \
  --name "$FUNCTION_APP" \
  --resource-group "$RESOURCE_GROUP" \
  --settings "AzureWebJobsFeatureFlags=EnableWorkerIndexing"

func azure functionapp publish "$FUNCTION_APP" --python

echo "Deployment complete. Function app: ${FUNCTION_APP}"
````

### c:\Users\macavall\tempProjects\fabric\proj1\host.json

Functions host configuration (required for `func` publish).

````json
// filepath: c:\Users\macavall\tempProjects\fabric\proj1\host.json
{
  "version": "2.0",
  "logging": {
    "applicationInsights": {
      "samplingSettings": {
        "isEnabled": true,
        "excludedTypes": "Request"
      }
    }
  },
  "extensionBundle": {
    "id": "Microsoft.Azure.Functions.ExtensionBundle",
    "version": "[4.*, 5.0.0)"
  }
}
````

### c:\Users\macavall\tempProjects\fabric\proj1\README.md

Add a de
```

