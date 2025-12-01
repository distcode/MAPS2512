
$Kapital = 1000
$Zinssatz = 0.02
$Endkapital = 1500
$Jahre = 0

do {
    $Kapital += $Kapital * $Zinssatz
    $Jahre++
} until ($Kapital -ge $Endkapital)

# } while ($Kapital -lt $Endkapital)

"Das Kapital muss $Jahre Jahre angelegt werden, um $Endkapital zu erreichen."