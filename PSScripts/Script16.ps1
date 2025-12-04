
function Do-Foo {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [String]$Name = 'Trainer'
    )

    $result = $PSCmdlet.ShouldProcess((hostname), "Spooler")
    if ($result) {
        Stop-Service Spooler
        Start-Service Spooler
    }

    $result = $PSCmdlet.ShouldProcess((hostname), "Write-Host")
    if ($result) {
        Write-Host "Auf Wiedersehen $Name"
    }

}