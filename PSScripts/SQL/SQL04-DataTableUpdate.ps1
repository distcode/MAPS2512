
$connectionstring = 'Server=tcp:maps2512sqlsrvfp.database.windows.net,1433;Initial Catalog=DB01;Persist Security Info=False;User ID=sqladmin;Password=Pa55w.rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'

$myConn = New-Object System.Data.SqlClient.SqlConnection
$myConn.ConnectionString = $connectionstring
$myConn.Open()
# $myConn.State

$commandstring = 'Select * From SalesLT.Customer'

$myDataAdapter = New-Object -TypeName System.Data.SqlClient.SqlDataAdapter($commandstring, $myConn)
$myCommandBuilder = New-Object System.Data.SqlClient.SqlCommandBuilder($myDataAdapter)

$myDataTable = New-Object -TypeName System.Data.DataTable
$rowcount = $myDataAdapter.Fill($myDataTable)

$myDataTable | Where-Object { $_.Lastname -eq 'Lator'} | 
    ForEach-Object {
        $_.CompanyName = 'maps'
        $_.EmailAddress = 'venti.lator@maps.at'
    }

$myDataAdapter.update($myDataTable)

$myConn.Close()