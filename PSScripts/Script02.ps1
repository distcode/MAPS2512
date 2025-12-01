
$Colors = @('Yellow','Blue','Red','DarkYellow','DarkRed')

$testColor = $Colors | Get-Random -Count 1

Switch -Wildcard ($testColor) {
    
    'Yellow' { # $testColor -eq 'Yellow'
        "Die Farbe ist GELB."
        break
    }
    'Blue' {
        "Die Farbe ist BLAU."
        break
    }
    'Red' {
        "Die Farbe ist ROT."
        break
    }
    'Dark*' { # $testColor -like 'Dark*'
        "Die Farbe ist DUNKEL. ($testColor)"
        break
    }
    default {
        "Diese Farbe ist mir unbekannt."
    }
}

' *** FINISHED *** '