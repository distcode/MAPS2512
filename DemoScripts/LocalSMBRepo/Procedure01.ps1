
# How to create your own repository

# As a requirement, create a share on a fileserver and assigne permissions to all administrators accordingly.

## For PowerShellGet module in Windows PowerShell

# Register the repo on a workstation/server
Register-PSRepository -Name 'LocalSMBRepo' -SourceLocation \\dc1\PSLocalRepo -ScriptSourceLocation \\dc1\PSLocalRepo -InstallationPolicy Trusted

# List current Package Sources
Get-PackageSource

# Publish / Upload module to LocalSBMRepo
Publish-Module -Path C:\MAPS2403\MAPSTools -Repository LocalSMBRepo -NuGetApiKey 'AnyPossibleKey'


## For Microsoft.PowerShell.PSResourceGet module in Windows PowerShell and PowerShell 7

# Register the repo on a workstation/server
Register-PSResourceRepository -Name 'LocalSMBRepo' -Trusted -Uri '\\dc1\PSLocalRepo'

# List current Package Sources
Get-PSResourceRepository

# Publish / Upload module to LocalSBMRepo
Publish-PSResoruce -Path C:\MAPS2403\MAPSTools -Repository 'LocalSMBRepo'


# MS Documentation: https://learn.microsoft.com/en-us/powershell/gallery/how-to/working-with-local-psrepositories?view=powershellget-3.x