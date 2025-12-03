
function Do-Foo {

    [CmdletBinding()]
    param (
        $firstparameter #,

        # [parameter(ValueFromRemainingArguments=$true)]
        # $allOther
    )

    Write-Host "FirstParameter: $firstparameter"
    Write-Host "args: $($args)"
    Write-Host "AllOther: $allOther"
    
}
