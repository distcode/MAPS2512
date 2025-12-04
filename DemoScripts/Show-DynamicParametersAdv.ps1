
function Show-DynamicParameters2 {
    [CmdletBinding()]
    param (
        [string]$Path,
        [string]$Name,
        [ValidateSet('User', 'Contact')]
        [string]$Type
    )

    dynamicparam {
        
        # Create a RuntimeDefinedParameterDictionary to hold dynamic parameters
        $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary

        if ($Type -eq 'User') {
        
            #
            # Add Parameter UPN and Password as secure string.
            #

            # Define a new dynamic parameter UPN
            $attributesUPN = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            # Add a Parameter attribute
            $paramAttributeUPN = New-Object System.Management.Automation.ParameterAttribute
            $paramAttributeUPN.Mandatory = $true
            $attributesUPN.Add($paramAttribute)
            # Create the Parameter
            $dynamicParamUPN = New-Object System.Management.Automation.RuntimeDefinedParameter("UPN", [string], $attributes)
            
            # Add the dynamic parameter to the dictionary
            $paramDictionary.Add("UPN", $dynamicParamUPN)
            
            # Define a new dynamic parameter Password as secure string
            $attributesPWD = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $paramAttributePWD = New-Object System.Management.Automation.ParameterAttribute
            $paramAttributePWD.Mandatory = $true
            $attributesPWD.Add($paramAttributePWD)

            $dynamicParamPWD = New-Object System.Management.Automation.RuntimeDefinedParameter("Password", [securestring], $attributesPWD)
            $paramDictionary.Add("Password", $dynamicParamPWD)            
        }
        elseif ($Type -eq 'Contact') {
            
            #
            # Add Parameter Email, Company and Status
            #

            # Define a new dynamic parameter Email
            $attributesEmail = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $paramAttributeEmail = New-Object System.Management.Automation.ParameterAttribute
            $attributesEmail.Add($paramAttributeEmail)
            $dynamicParamEmail = New-Object System.Management.Automation.RuntimeDefinedParameter("Email", [string], $attributesEmail)
            $paramDictionary.Add("Email", $dynamicParamEmail)

            # Define a new dynamic parameter Company
            $attributesCompany = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $paramAttributeCompany = New-Object System.Management.Automation.ParameterAttribute
            $attributesCompany.Add($paramAttributeCompany)
            $dynamicParamCompany = New-Object System.Management.Automation.RuntimeDefinedParameter("Company", [string], $attributesCompany)
            $paramDictionary.Add("Company", $dynamicParamCompany)

            # define a new dynamic parameter Status
            $attributesStatus = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $paramAttributeStatus = New-Object System.Management.Automation.ParameterAttribute
            $validateSetStatus = New-Object System.Management.Automation.ValidateSetAttribute("Supplyer", "Customer")
            $attributesStatus.Add($paramAttributeStatus)
            $attributesStatus.Add($validateSetStatus)
            $dynamicParamStatus = New-Object System.Management.Automation.RuntimeDefinedParameter("Status", [string], $attributesStatus)
            $paramDictionary.Add("Status", $dynamicParamStatus)
            
            # Add a ValidateSet attribute
            # $validateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute("Option1", "Option2", "Option3")
            # $attributes.Add($validateSetAttribute)
        }
        else {
            throw "Invalid Type specified. Valid values are 'User' or 'Contact'."
        }
        return $paramDictionary
    }

    process {
        # Retrieve the value of the dynamic parameter
        $dynamicOptionValue = $PSBoundParameters["DynamicOption"]

        # Output the selected dynamic parameter value
        Write-Output "You selected: $dynamicOptionValue"
    }
}

