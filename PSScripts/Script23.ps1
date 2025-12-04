

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Continue'

$a = 100; # Read-Host 'Bitte Anzahl der Birnen eingeben'
$b = 0; # Read-Host 'Bitte Anzahl der Esser(innen) eigeben'

"Birnen: $a"
"Esser(innen): $b"

Get-ChildItem -Path HKLM:\
if (-not $?) {
    "FEHLER !!!!"
}
$Aufteilung = $a / $b 
"Jeder kann $Aufteilung Birnen essen."

' **** FINISHED **** '