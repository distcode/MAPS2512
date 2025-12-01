
BEGIN {
    "Guten Tag!"
    $i = 0
}

PROCESS {
    Write-Host "RAINBOW" -ForegroundColor $_
    $i++
}

END {
    "Es wurden $i Farben übergeben."
    "Auf Wiedersehen!"
}