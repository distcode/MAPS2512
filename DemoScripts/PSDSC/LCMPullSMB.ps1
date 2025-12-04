[DSCLocalConfigurationManager()]
Configuration LCMPullSMB
{
    param
    (
        [parameter(Mandatory=$true)][String[]]$TargetComputer,
        [parameter(Mandatory=$true)][String]$guid
    )

    Node $TargetComputer
    {
        Settings
        {
            RefreshMode = 'Pull'
            RebootNodeIfNeeded = $true
            ConfigurationMode = 'ApplyAndMonitor'
            ConfigurationID = $guid
        }

        ConfigurationRepositoryShare MAPSDSCShare
        {
            SourcePath = "\\Srv1\DSC"
        }
    }
}