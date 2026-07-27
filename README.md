# proj1 — Microsoft Fabric Functions App

A Python-based [Microsoft Fabric Functions](https://learn.microsoft.com/fabric/data-engineering/user-data-functions-overview) app.

## Prerequisites

- Python 3.11
- [VS Code](https://code.visualstudio.com/) with the **Fabric Functions** / **Azure Functions** extension
- A Microsoft Fabric workspace

## Setup

```powershell
# Create and activate a virtual environment
python -m venv .venv
.venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt
```

## Included functions

| Function       | Parameters      | Description                        |
| -------------- | --------------- | ---------------------------------- |
| `hello_fabric` | `name: str`     | Returns a greeting.                |
| `add_numbers`  | `a: int, b: int`| Returns the sum of two integers.   |
| `utc_now`      | —               | Returns the current UTC timestamp. |

## Running locally

Use the Fabric Functions extension in VS Code to run and debug the app locally,
then invoke a function (e.g., `hello_fabric`) with the provided test UI.

## Publishing

This app is hosted **inside Microsoft Fabric** as a User Data Functions item.
There is no Azure CLI / `az` deployment path.

### Option A — VS Code Fabric extension (recommended)

1. Install the **Fabric** extension for VS Code and sign in to your Fabric account.
2. Open this folder in VS Code.
3. From the Fabric extension, select your **workspace**.
4. Use **Publish** to create/update the User Data Functions item in Fabric.
5. Once published, run and test functions from the Fabric portal or the extension.

### Option B — Fabric portal

1. In your Fabric workspace, create a new **User Data Functions** item.
2. Open the online editor and paste the contents of `function_app.py`.
3. Add any packages from `requirements.txt` in the item's **Library management**.
4. **Publish**, then invoke functions from the portal test UI.

## Connecting to Fabric data

The `function_app.py` file includes a commented `query_lakehouse` example.
To use it:

1. In the Fabric portal, open this Functions item and add a **data connection**
   to your Lakehouse, Warehouse, or SQL Database.
2. Note the connection **alias**.
3. Uncomment the example and set `alias=` to match your connection.
