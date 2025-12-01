
param (
    [parameter(Mandatory=$true,HelpMessage='Bitte, Wer bist du?')]
    [String]$Name,

    [ValidateSet("gut","schlecht","neutral")]
    [String]$Stimmung = "gut",

    [int]$Alter = 29
)

# Definitions

# Main Logic
Write-Host "Hallo, $Name! ($alter)"
Write-Host "Du bist heute $Stimmung drauf."
