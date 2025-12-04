
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"


if (-not (Test-Path -Path c:\Temp2)) {
    new-item -path c:\temp2 -Type Directory
}

$a = 100; # Read-Host 'Bitte Anzahl der Äpfel eingeben'
$b = 20; # Read-Host 'Bitte Anzahl der Esser(innen) eigeben'

"Äpfel: $a"
"Esser(innen): $b"

try {
    
    Get-ChildItem -Path hklm:\ # -ErrorAction Stop

    
    $Aufteilung = $a / $b 
    

}
catch [System.DivideByZeroException] {
    "Bitte nicht 0 eingeben ..."
}
catch {
    "Unbekannter Fehler"    
    $Error[0] | Format-List -Property * -Force
    return
}
finally {
    # $myConn.Close()
}
"Jeder kann $Aufteilung Äpfel essen."
