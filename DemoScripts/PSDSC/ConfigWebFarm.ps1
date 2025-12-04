Configuration WebFarm
{
    param
    (
        [String[]]$TargetComputer
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    
    Node $TargetComputer
    {
        WindowsFeature WebSrv
        {
            Name = 'Web-Server'
            Ensure = 'Present'
        }

        WindowsFeature TelnetSrv
        {
            Name = 'Telnet-Server'
            Ensure = 'Absent'
        }

        Environment SetbyDSC {
            Name = 'SetByDSC'
            Ensure = 'Present'
            Value = 'MAPS'
        }
    }
}

<#
    How to use:
        
        1. Dot-Sourcing: . .\SimpleConfiguration.ps1

        2. Get-Command -CommandType Configuration 
        
        3. WebFarm -TargetComputer "Srv2","Srv3" -OutputPath C:\DSCMofs\Configs

        4. Get-Childitem C:\DSCMorfs\Configs

        5. psedit C:\DSCMofs\Configs\Srv2.mof
#>