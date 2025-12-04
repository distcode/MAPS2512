[DSCLocalConfigurationManager()]
Configuration LCMPush
{
    param
    (
        [String[]]$TargetComputer
    )

    Node $TargetComputer
    {
        Settings
        {
            RebootNodeIfNeeded = $true
            ConfigurationMode = 'ApplyAndAutoCorrect'
            AllowModuleOverwrite = $true
            RefreshMode = 'Push'
        }
    }
}

<#
    How to use:
        
        1. LCMPush -TargetComputer "Srv2","Srv3" -OutputPath "c:\DSCMofs\LCM"

        2. Get-DSCLocalConfigurationManager -cimsession Srv2

        3. Set-DscLocalConfigurationManager -Path c:\DSCMofs\LCM -Computername "Srv2","Srv3"

        4. Get-DSCLocalConfigurationManager -CimSession Srv2
#>