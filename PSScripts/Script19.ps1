
function Do-Foo {

    "Function Scope - 1: $a"
    $global:a = 200
    "Function Scope - 2: $a"
}
    
$a = 100
Do-Foo
"Script Scope: $a"