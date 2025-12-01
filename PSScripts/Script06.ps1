$Kapital = 1600
$Zinssatz = 0.02
$Endkapital = 1500
$Jahre = 0

while ($Kapital -lt $Endkapital) {
    $Kapital += $Kapital * $Zinssatz
    $Jahre++
}

"Das Kapital muss $Jahre Jahre angelegt werden, um $Endkapital zu erreichen."