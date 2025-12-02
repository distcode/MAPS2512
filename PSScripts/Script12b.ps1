
$myHosts = @()

$myObject = New-Object PSObject 
$myObject | Add-Member -MemberType NoteProperty -Name "Hostname" -Value 'CL1'
$myObject | Add-Member -MemberType NoteProperty -Name "RAM" -Value (8*1GB)
$myObject | Add-Member -MemberType ScriptProperty -Name "RAMGB" -value { $this.RAM / 1GB }
$myObject | Add-Member -MemberType AliasProperty -Name "Memory" -Value "RAMGB"

$myHosts += $myObject

$myObject = New-Object PSObject 
$myObject | Add-Member -MemberType NoteProperty -Name "Hostname" -Value 'Srv1'
$myObject | Add-Member -MemberType NoteProperty -Name "RAM" -Value (24*1GB)
$myObject | Add-Member -MemberType ScriptProperty -Name "RAMGB" -value { $this.RAM / 1GB }
$myObject | Add-Member -MemberType AliasProperty -Name "Memory" -Value "RAMGB"

$myHosts += $myObject

$myObject = New-Object PSObject 
$myObject | Add-Member -MemberType NoteProperty -Name "Hostname" -Value 'Srv2'
$myObject | Add-Member -MemberType NoteProperty -Name "RAM" -Value (32*1GB)
$myObject | Add-Member -MemberType ScriptProperty -Name "RAMGB" -value { $this.RAM / 1GB }
$myObject | Add-Member -MemberType AliasProperty -Name "Memory" -Value "RAMGB"

$myHosts += $myObject


$myHosts
