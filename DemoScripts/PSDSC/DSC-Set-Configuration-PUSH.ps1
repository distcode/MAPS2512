
param ([String[]]$Computers = @("RDCB1","RDCB2") )

$ConfigData = @{   
    AllNodes = @(        
        
        foreach ($c in $Computers)
        {
            @{ NodeName = $c; PSDscAllowPlainTextPassword = $true }
        } 
    )  
}

Configuration Set-Configuration-Complex
{
    param ([String[]]$Computers = $global:Computers)

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    # Import-DscResource -ModuleName PSDSCResources
    
    # $Computers = @( "RDCB1","RDCB2" )
    [pscredential]$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "TestUser",(ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force)
    
    Node $Computers
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

        WindowsFeature DSCTelnetFeature
        {
            Name = 'Telnet-Client'
            Ensure = 'Absent'
        }

        WindowsFeature DSCWindowsBackup
        {
            Name = 'Windows-Server-Backup'
            Ensure = 'Present'
            DependsOn = '[Environment]DSCEnvironmentVariable'
        }

        User DSCUser
        {
            UserName = 'HarryP'
            FullName = 'Harry Potter'
            Password = $cred
            Ensure = 'Present'
        }

        Group DSCGroup
        {
            GroupName = 'Zauberer'
            Ensure = 'Present'
            Members = 'HarryP'
            DependsOn = '[User]DSCUser'
        }
                
    }
}