
function Set-ADUserAdv {

    [CmdletBinding()]
    param (
        
        [parameter(Mandatory=$true)]
        [ArgumentCompleter({

            param (
                $commandName,
                $parameterName,
                $wordToComplete,
                $commandAst,
                $fakeBoundParameters
            )

            $users = Get-ADUser -Filter * | 
            Where-Object { $_.DistinguishedName -notlike '*cn=users,*'} |
            Where-Object { $_.SamAccountName -like "*$wordToComplete*"} |
            Sort-Object -Property SamAccountName
            
            foreach ($tempuser in $users) {
                $listItemText = $tempUser.SamAccountName
                $completionText = "$listItemText"
                $toolTip = "$listitemtext`n`r$($tempUser.UserPrincipalName)`n`r$($tempUser.DistinguishedName)"
                [System.Management.Automation.CompletionResult]::new($completionText,$listItemText,"ParameterValue", $toolTip)
            }
        })]
        [string]$Identity
    )

    Write-Host "Identity: $Identity"
}