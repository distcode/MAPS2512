
$Colors = @('White', 'Yellow', 'DarkYellow', 'Magenta', 'Cyan')

<#
for ( $i = 0; $i -le ($Colors.Count - 1); $i++ ) {

    "Die Farbe ist $($colors[$i])."

}
    #>

foreach ( $tempColor in $Colors ) {

    "Die Farbe ist $tempColor. "
}
