
foreach ($tempcolor in $input) {
    # Write-Host "Die aktuelle Farbe ist: $tempcolor"
    Write-Host "RAINBOW" -ForegroundColor $tempcolor
}

$input.reset()

foreach ($tempcolor in $input) {
    # Write-Host "Die aktuelle Farbe ist: $tempcolor"
    Write-Host "RAINBOW" -BackgroundColor $tempcolor
}

' *** FINISHED *** '