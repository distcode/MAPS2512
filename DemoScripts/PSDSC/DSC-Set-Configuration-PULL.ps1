
Configuration Set-Configuration-Simple
{
    
    Import-Module PSDesiredStateConfiguration

    Node ConfigSimple
    {
        Environment DSCEnvironmentVariable
        {
            Name = 'DSCVariable'
            Value = 'Hurra'
            Ensure = 'Present'
        }

        WindowsProcess DSCWinProcess
        {
            Path = 'C:\Windows\system32\mspaint.exe'
            Arguments = ''
            Ensure = 'Absent'
        }

        WindowsOptionalFeature DSCTelnetFeature
        {
            Name = Telnet-Server
            Ensure = 'Disable'
        }

        WindowsOptionalFeature DSCWindowsBackup
        {
            Name = 'Windows-Server-Backup'
            Ensure = 'Enable'
            DependsOn = '[Environment]DSCEnvironmentVariable'
        }
    }
}