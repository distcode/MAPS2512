
function  Write-Hello {
    
    Write-Host "Guten Tag!"
    
}

function Start-Feierabend {

    param (
        [int]
        $Starttime = 17
    )

    Write-Host "Feierabend beginnt heute um $Starttime Uhr."
}

$tempVariable = Get-Random -Minimum 1 -Maximum 10
New-Variable -Name MAPSVariable -Value $tempVariable

Set-Alias -Name sos -Value Get-Help

Export-ModuleMember -Variable 'MapsVariable'
Export-ModuleMember -Function @('Write-Hello','Start-Feierabend')
Export-ModuleMember -Alias sos