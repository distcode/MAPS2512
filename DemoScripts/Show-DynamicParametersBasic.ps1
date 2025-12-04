<# 
    .SYNOPSIS
        This scipt demonstrates how to use dynamic parameters in PowerShell.
    .DESCRIPTION
        Dynamic parameters are parameters that are added to a cmdlet at runtime based on the value of other parameters.
        This script defines a function that takes a mandatory parameter and a dynamic parameter.

        The function Set-UserInfo should be able to change specific AD user's attributes:
            - FirstName
            - LastName
            - Department
            - Title

            - ChangeAddress (switch)
            - City
            - StreetAddress

            -Identity (mandatory)

        The attributes Firstname, LastName, Department and Title are optional for each a static parameter must be defined.
        The attributes City and StreetAddress are optional for each a dynamic parameter must be defined.
        The dynamic parameters are only available if a static parameter 'ChangeAddress' is set to true (switch).
        The Identity parameter is mandatory and must be defined as a static parameter.
        For testing purposes, the function should only write the parameters to the console.

        Step-by-step instructions found in the book 'PowerShell 5' by Dr. Tobias Weltner, Chapter 16, page 566.
    .EXAMPLE
        .\Show-DynamicParameters -Identity "jdoe" -FirstName "John" -LastName "Doe" -Department "IT" -Title "Developer"
        This example sets the user's information without changing the address. No dynamic parameters are displayed.
    .EXAMPLE
        .\Show-DynamicParameters -Identity "jdoe" -FirstName "John" -LastName "Doe" -Department "IT" -Title "Developer" -ChangeAddress -City "New York" -StreetAddress "123 Main St"
        This example sets the user's information and changes the address. The dynamic parameters City and StreetAddress are displayed.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$Identity,

    [Parameter()]
    [string]$FirstName,

    [Parameter()]
    [string]$LastName,

    [Parameter()]
    [string]$Department,

    [Parameter()]
    [string]$Title,

    [Parameter()]
    [switch]$ChangeAddress
)

# Dynamic parameters
dynamicparam {
    if ($ChangeAddress) {
        $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

        # City Parameter
        $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        
        $cityAttribute = New-Object System.Management.Automation.ParameterAttribute
        $cityAttribute.Mandatory = $false
        $attributeCollection.Add($cityAttribute)
        
        $cityParameter = New-Object System.Management.Automation.RuntimeDefinedParameter("City", [string], $attributeCollection)
        $paramDictionary.Add("City", $cityParameter)

        # StreetAddress Parameter
        $attributeCollection = New-object System.Collections.ObjectModel.Collection[System.Attribute]
        
        $streetAddressAttribute = New-Object System.Management.Automation.ParameterAttribute
        $streetAddressAttribute.Mandatory = $false
        $attributeCollection.Add($streetAddressAttribute)
        
        $streetAddressParameter = New-Object System.Management.Automation.RuntimeDefinedParameter("StreetAddress", [string], $attributeCollection)
        $paramDictionary.Add("StreetAddress", $streetAddressParameter)
        # Return the dynamic parameters
        $paramDictionary
    }
}

# Process the parameters
end {
    Write-Host "Identity: $Identity"
    Write-Host "FirstName: $FirstName"
    Write-Host "LastName: $LastName"
    Write-Host "Department: $Department"
    Write-Host "Title: $Title"

    # HINT: The dynamic parameters are only available if the ChangeAddress switch is set to true.
    # Furthermore, the dynamic parameters are only available via the $PSBoundParameters variable.
    if ($ChangeAddress) {
        Write-Host "City: $($PSBoundParameters['City'])"
        Write-Host "StreetAddress: $($PSBoundParameters['StreetAddress'])"
    }
}


