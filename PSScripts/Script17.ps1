
function Set-LocalUserAdv {

    [CmdletBinding()]
    param (
        [string]$Firstname,
        [string]$Lastname,
        [switch]$ChangeAddress
    )

    dynamicparam {

        if ($ChangeAddress) {

            $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

            $attributeContainerCity = New-Object 'System.Collections.ObjectModel.Collection[System.Attribute]'
            
            $attributeCity = New-Object System.Management.Automation.ParameterAttribute
            $attributeCity.Mandatory = $true
            $attributeCity.HelpMessage = "Bitte eine Stadt angeben."
            $attributeContainerCity.Add($attributeCity)

            $parameterCity = New-Object System.Management.Automation.RuntimeDefinedParameter('City', [string], $attributeContainerCity)
            $paramDictionary.Add("City", $parameterCity)
            
            $attributeContainerCountry = New-Object 'System.Collections.ObjectModel.Collection[System.Attribute]'
            $attributeCountry = New-Object System.Management.Automation.ParameterAttribute
            $attributeContainerCountry.Add($attributeCountry)
            
            $parameterCountry = New-Object System.Management.Automation.RuntimeDefinedParameter('Country', [string], $attributeContainerCountry)
            $paramDictionary.Add("Country", $parameterCountry)

            $attributeContainerStatus = New-Object 'System.Collections.ObjectModel.Collection[System.Attribute]'
            $attributeStatus = New-Object System.Management.Automation.ParameterAttribute
            $attributestatus.Mandatory = $true
            $attributeContainerStatus.Add($attributeStatus)
            $validateSetStatus = New-Object System.Management.Automation.ValidateSetAttribute('Supplyer','Customer')
            $attributeContainerStatus.Add($validateSetStatus)

            $parameterStatus = New-Object System.Management.Automation.RuntimeDefinedParameter('Status', [string], $attributeContainerStatus)
            $paramDictionary.Add("Status", $parameterStatus)

            $paramDictionary

        }
    }

    begin {
        Write-Host "Firstname: $Firstname"
        Write-Host "Lastname: $Lastname"
        Write-Host "ChangeAddress: $ChangeAddress"
        
        $PSBoundParameters

        <#
        Write-host "City: $city"
        Write-Host "Country: $country"
        #>
        Write-host "City: $($PSBoundParameters.City)"
        Write-Host "Country: $($PSBoundParameters.Country)"
        Write-Host "Status: $($PSBoundParameters.Status)"
    }

    process {

    }
        
    end {

    }

}