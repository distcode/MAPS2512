<#
.SYNOPSIS
    This script demonstrates dynamic argument completion in PowerShell.
.DESCRIPTION
    This script lists all or specific Hyper-V VMs from localhost. The parameter VMName supports dynamic argument completion, which is created using the ArgumentCompleter attribute.
    The script block of the ArgumentCompleter attribute is executed when the user presses the Tab key or Ctrl+Space while typing the VMName parameter.

    The same script block could be used to extend the Get-VM cmdlet to support dynamic argument completion for the VMName parameter.    
    
    Step-by-step instructions found in 'PowerShell 7 und Windows PowerShell' by Dr. Tobias Weltner, Chapter 14, page 471.
    HINT: In the listing on page 472, the line '$_.count = $_.RecordCount' is not working, therefore skip it.
.EXAMPLE
    You can use the Tab key or Ctrl+Space to trigger the dynamic argument completion for the VMName parameter.
    
    .\Show-ArgumentCompleter -VMName <Tab>|<Ctrl+Space>
    
.EXAMPLE
    You can also use the script block to extend the Get-VM cmdlet to support dynamic argument completion for the Name parameter.

    Register-ArgumentCompleter -CommandName Get-VM -ParameterName Name -ScriptBlock {
            param(
                [string] $CommandName,
                [string] $ParameterName,
                [string] $WordToComplete,
                [System.Management.Automation.Language.CommandAst] $CommandAst,
                [System.Collections.IDictionary] $FakeBoundParameters
            )
    
            $CompletionResults = [System.Collections.Generic.List[System.Management.Automation.CompletionResult]]::new()
    
            $VMs = (Get-VM | Where-Object { $_.Name -like "*$WordToComplete*" }).Name
            foreach ($VM in $VMs) {

                $ListItemText = $VM
                $CompletionText = $VM
                $Tooltip = "LocalhostVM: $ListItemText"
                $CompletionResults.Add(
                    [System.Management.Automation.CompletionResult]::new(
                        $CompletionText,
                        $ListItemText,
                        [System.Management.Automation.CompletionResultType]::ParameterValue,
                        $Tooltip
                    )
                )
            }
                
            return $CompletionResults
        }
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]    
    [ArgumentCompleter({
            
            param(
                [string] $CommandName,
                [string] $ParameterName,
                [string] $WordToComplete,
                [System.Management.Automation.Language.CommandAst] $CommandAst,
                [System.Collections.IDictionary] $FakeBoundParameters
            )
    
            $CompletionResults = [System.Collections.Generic.List[System.Management.Automation.CompletionResult]]::new()
    
            $VMs = (Get-VM | Where-Object { $_.Name -like "*$WordToComplete*" }).Name
            foreach ($VM in $VMs) {

                $ListItemText = $VM
                $CompletionText = $VM
                $Tooltip = "LocalhostVM: $ListItemText"
                $CompletionResults.Add(
                    [System.Management.Automation.CompletionResult]::new(
                        $CompletionText,
                        $ListItemText,
                        [System.Management.Automation.CompletionResultType]::ParameterValue,
                        $Tooltip
                    )
                )
            }
       
            return $CompletionResults
        })]
    [string]$VMName = $null
)

Write-Host "VMName: $VMName"
