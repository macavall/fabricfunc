import datetime
import fabric.functions as fn

udf = fn.UserDataFunctions()


@udf.function()
def hello_fabric(name: str) -> str:
    """Simple sample function that greets the caller."""
    return f"Hello, {name}! Welcome to Microsoft Fabric Functions."


@udf.function()
def add_numbers(a: int, b: int) -> int:
    """Returns the sum of two integers."""
    return a + b


@udf.function()
def utc_now() -> str:
    """Returns the current UTC timestamp in ISO format."""
    return datetime.datetime.utcnow().isoformat() + "Z"


# Example of a function connected to a Fabric Lakehouse.
# 1. Add a Lakehouse connection in the Fabric portal (alias below).
# 2. Uncomment and adjust the query as needed.
#
# @udf.connection(argName="lakehouse", alias="MyLakehouse")
# @udf.function()
# def query_lakehouse(lakehouse: fn.FabricLakehouseClient) -> list:
#     connection = lakehouse.connectToSql()
#     cursor = connection.cursor()
#     cursor.execute("SELECT TOP 10 * FROM dbo.MyTable")
#     rows = [list(row) for row in cursor.fetchall()]
#     cursor.close()
#     connection.close()
#     return rows
