
[DscLocalConfigurationManager()]
Configuration StdLCMConfiguration {

    $Servers = @('DC1','SRV1')
    
    Node $Servers {
        Settings {
            ConfigurationMode = 'ApplyAndAutoCorrect'
            ConfigurationModeFrequencyMins = 60
            RebootNodeIfNeeded = $true
        }
    }

}