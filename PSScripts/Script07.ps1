
param (
    [parameter(Mandatory=$true,HelpMessage='Bitte, Wer bist du?')]
    [String]$Name,

    [ValidateSet("gut","schlecht","neutral")]
    [Alias("Mood")]
    [String]$Stimmung = "gut",

    [int]$Alter = 29
)

# Help

# Definitions

# Main Logic
Write-Host "Hallo, $Name! ($alter)"
Write-Host "Du bist heute $Stimmung drauf."
