
$connectionstring = 'Server=tcp:maps2512sqlsrvfp.database.windows.net,1433;Initial Catalog=DB01;Persist Security Info=False;User ID=sqladmin;Password=Pa55w.rd;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'

$myConn = New-Object System.Data.SqlClient.SqlConnection
$myConn.ConnectionString = $connectionstring
$myConn.Open()
# $myConn.State

$myComm = New-Object System.Data.SqlClient.SqlCommand
$myComm.CommandText = 'Select * From SalesLT.Customer'
$myComm.Connection = $myConn

$myDataReader = $myComm.ExecuteReader()

$i = 0
while ($myDataReader.Read()) {

    "$($myDataReader.Item('FirstName')) $($myDatareader.Item('Lastname')), $($myDataReader.Item('CompanyName'))"
    $i++
    <# Alternative
    $Firstname  = $myDataReader.item('Firstname')
    $Lastname   = $myDataReader.Item('Lastname')
    $Company    = $myDataReader.Item('Companyname')
    "$Firstname $Lastname, $Company"
    #>
}

"Anzahl Records: $i"

$myConn.Close()