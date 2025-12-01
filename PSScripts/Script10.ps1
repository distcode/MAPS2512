
param (
    [parameter(Mandatory = $true, ValueFromPipeline = $true)]
    $Colors
)

BEGIN {}

PROCESS {
    foreach ($tempColor in $Colors) {
        Write-Host "RAINBOW" -ForegroundColor $tempColor
    }
}

END {}