
for ( $i = 1; $i -le 5; $i++) { # $i++ == $i = $i + 1

    if ( ($i % 3) -eq 0 ) {
        "Modulo 0"
        # break # continue
    }
    
    "Das ist Durchlauf $i"

}


for ( $i = 200; $i -ge 100; $i -= 10) { # $i += 10 == $i = $i + 10
    
    "Das ist Durchlauf $i"

}