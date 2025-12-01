
$z = Get-Random -Minimum 1 -Maximum 100

if ( $z -gt 75 ) {

    "Die Zahl ist größer als 75, nämlich $z"
}
elseif ( $z -gt 50 ) {
    
    "Die Zahl ist größer als 50, nämlich $z"
}
elseif ( $z -gt 25 ) {
    
    "Die Zahl ist größer als 25, nämlich $z"
}
else {

    "Die Zahl ist nicht größer als 25, nämlich $z"
}

' *** FINISHED *** '