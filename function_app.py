import datetime
import json

import azure.functions as func

app = func.FunctionApp(http_auth_level=func.AuthLevel.FUNCTION)


def _read_param(req: func.HttpRequest, name: str):
    """Read a parameter from the query string or JSON body."""
    value = req.params.get(name)
    if value is not None:
        return value
    try:
        body = req.get_json()
    except ValueError:
        return None
    return body.get(name) if isinstance(body, dict) else None


@app.route(route="hello_fabric", methods=["GET", "POST"])
def hello_fabric(req: func.HttpRequest) -> func.HttpResponse:
    """Simple sample function that greets the caller."""
    name = _read_param(req, "name")
    if not name:
        return func.HttpResponse(
            "Please pass a 'name' on the query string or in the request body.",
            status_code=400,
        )
    return func.HttpResponse(f"Hello, {name}! Welcome to Azure Functions.")


@app.route(route="add_numbers", methods=["GET", "POST"])
def add_numbers(req: func.HttpRequest) -> func.HttpResponse:
    """Returns the sum of two integers."""
    a = _read_param(req, "a")
    b = _read_param(req, "b")
    if a is None or b is None:
        return func.HttpResponse(
            "Please pass 'a' and 'b' on the query string or in the request body.",
            status_code=400,
        )
    try:
        result = int(a) + int(b)
    except (TypeError, ValueError):
        return func.HttpResponse(
            "Parameters 'a' and 'b' must be integers.",
            status_code=400,
        )
    return func.HttpResponse(
        json.dumps({"a": int(a), "b": int(b), "sum": result}),
        mimetype="application/json",
    )


@app.route(route="utc_now", methods=["GET"])
def utc_now(req: func.HttpRequest) -> func.HttpResponse:
    """Returns the current UTC timestamp in ISO format."""
    now = datetime.datetime.now(datetime.timezone.utc).isoformat()
    return func.HttpResponse(
        json.dumps({"utc_now": now}),
        mimetype="application/json",
    )
