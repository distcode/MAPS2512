
function Do-Foo {

    param (
        $Name,
        $Type,
        $State,
        $Size
    )

    Write-host "Do anything ... :"
    $Name
    $Type
    $State
    $Size
    
    # $PSBoundParameters

    $PSBoundParameters.Edition = $Size
    $PSBoundParameters.Remove('Size')
    $PSBoundParameters.Remove('Status')
    
    # Do-FooAgain -Name $Name -Type $Type -Edition $Size
    Do-FooAgain @PSBoundParameters
}

function Do-FooAgain {
    
    param (
        $Name,
        $Type,
        $Edition
        )
        
        Write-host "Do anything again ... :"
        $Name
        $Type
        $Edition

      #  $PSBoundParameters
}



Do-Foo -Name 'Stefan' -Type 'Phone' -State 'Broken' -Size 'Max'