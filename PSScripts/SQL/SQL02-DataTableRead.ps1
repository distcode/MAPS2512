
$connectionstring = 'Server=tcp:maps2512sqlsrvfp.database.windows.net,1433;Initial Catalog=DB01;Persist Security Info=False;User ID=sqladmin;Password=Pa55w.rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'

$myConn = New-Object System.Data.SqlClient.SqlConnection
$myConn.ConnectionString = $connectionstring
$myConn.Open()
# $myConn.State

$commandstring = 'Select * From SalesLT.Customer'

$myDataAdapter = New-Object -TypeName System.Data.SqlClient.SqlDataAdapter($commandstring, $myConn)
$myDataTable = New-Object -TypeName System.Data.DataTable

$rowCount = $myDataAdapter.Fill($myDataTable)

# $myDataTable

# $myDataTable.Rows[9].Item('Lastname')

$myDataTable | Where-Object { $_.Lastname -like 'c*' } | Select-Object -Property LastName,FirstName,CompanyName

"Anzahl Records: $rowCount"

$myConn.Close()