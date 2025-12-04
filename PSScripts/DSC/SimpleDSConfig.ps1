
Configuration StdMAPSServerConfig {

    $Servers = @('DC1','SRV1')
    
    Node $Servers {

        WindowsFeature WBackup {
            Name = 'Windows-Server-Backup'
            Ensure = 'Present'
        }

        WindowsFeature TelnetClient {
            Name = 'Telnet-Client'
            Ensure = 'Absent'
        }
    }
}