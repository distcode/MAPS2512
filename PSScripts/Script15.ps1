
function Do-Foo {

    [CmdletBinding()]
    param ()

    Write-Host "standard text A"

    Write-Verbose "Zusatzinformation ..."

    Write-Debug "Debug Information ..."

    Write-Host "standard text B"


}