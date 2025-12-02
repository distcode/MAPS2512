
$myObject = New-Object PSObject 
$myObject | Add-Member -MemberType NoteProperty -Name "Hostname" -Value 'CL1'
$myObject | Add-Member -MemberType NoteProperty -Name "RAM" -Value (8*1GB)
$myObject | Add-Member -MemberType ScriptProperty -Name "RAMGB" -value { $this.RAM / 1GB }
$myObject | Add-Member -MemberType AliasProperty -Name "Memory" -Value "RAMGB"
$myObject | Add-Member -MemberType ScriptMethod -Name "ShutDown" -Value {
    param (
    [ValidateSet("Hybernate","PowerOff","Sleep")]    
    [string]$Type,
    $TimeOut = 10
    )
    Write-Host "Shutting down $($this.Hostname)... Mode: $Type"
    # Stop-Computer -ComputerName $this.Hostname
}