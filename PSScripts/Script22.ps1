

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

trap {
    "Es ist ein Fehler aufgetreten ..."
    $Error[0]
    continue
}

$a = 100; # Read-Host 'Bitte Anzahl der Birnen eingeben'
$b = 0; # Read-Host 'Bitte Anzahl der Esser(innen) eigeben'

"Birnen: $a"
"Esser(innen): $b"

Get-ChildItem -Path hklm:\ # -ErrorAction Stop
$Aufteilung = $a / $b 
"Jeder kann $Aufteilung Birnen essen."

if (-not (Test-Path -Path c:\temp2)) {
    throw
}

' **** FINISHED **** '
    

