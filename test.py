import pyodbc

cnxn = pyodbc.connect(
    'Driver={ODBC Driver 17 for SQL Server};Server=tcp:hackathondatabase.database.windows.net,1433;Database=hachathon;Uid=hackathon-admin;Pwd={Pune@2024};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;'
    )
cursor = cnxn.cursor()
print(cursor)