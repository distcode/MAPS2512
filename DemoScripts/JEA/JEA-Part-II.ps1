#
# Demonstration taken from 'PowerShell 5.0 - Book' by Tobias Weltner
#
# JEA - Rolebased
#

# Prerequisites

## Users & Groups
$serviceAdmins = New-ADGroup -Name JEA_Service -GroupScope DomainLocal -PassThru
Add-ADGroupMember -Identity $serviceAdmins.samaccountname -Members Mark
$infoAdmins = New-ADGroup -Name JEA_Info -GroupScope DomainLocal -PassThru
Add-ADGroupMember -Identity $infoadmins.samaccountname -Members Stefan

# Endpoint & Role Assignment

## Pfadname zu einer neuen pssc-Datei festlegen
if (!(Test-Path -Path "C:\Maps2505\Temp")) {
    New-Item -Path "C:\Maps2505\Temp" -ItemType Directory
}
$Path = "C:\Maps2505\Temp\jea3.pssc"

## Rollen definieren
$roles = @{
    'maps\JEA_Info' = @{RoleCapabilities = 'Information', 'Generic'}
    'maps\JEA_Service' = @{RoleCapabilities = 'ManageService', 'ManageLog', 'Generic'}
}
## Datei anlegen
New-PSSessionConfigurationFile -Path $Path `
                               -SessionType RestrictedRemoteServer `
                               -LanguageMode NoLanguage `
                               -ExecutionPolicy Restricted `
                               -RunAsVirtualAccount `
                               -RoleDefinitions $roles 

## Endpunkt anlegen
Register-PSSessionConfiguration -Path $Path -Name JEA3 -Force

## Endpunkt prüfen
Get-PSSessionConfiguration -Name JEA3



# Rollenberechtigungen definiern (role capability)

#region Capability Generic
## Name der Fähigkeit:
$Name = 'Generic'
## private Funktion definieren:
$GetUserInfo = @{
    Name = 'Get-UserInfo'
    ScriptBlock = { $PSSenderInfo }
}
## Konfiguration definieren:
## = Parameter für New-PSRoleCapabilityFile
## Link: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/new-psrolecapabilityfile?view=powershell-7.3
$Config = @{
    FunctionDefinitions = $GetUserInfo
}
## Name des neuen Moduls:
$guid = [Guid]::NewGuid().toString('d')
$ModuleName = 'Role{0}_{1}' -f $Name,$guid
$modulePath = "$env:programfiles\WindowsPowerShell\Modules\$ModuleName"
## Modul herstellen:
New-Item -Path "$modulePath\RoleCapabilities" -ItemType Directory -Force
New-PSRoleCapabilityFile -Path "$modulePath\RoleCapabilities\$Name.psrc" @Config 
New-ModuleManifest -Path "$modulePath\$ModuleName.psd1"
#endregion

#region Capability Information
## Name der Fähigkeit:
$Name = 'Information'
## Konfiguration definieren:
$Config = @{
    VisibleExternalCommands = 'c:\windows\system32\systeminfo.exe', 'c:\windows\system32\netstat.exe'
    VisibleCmdlets = 'Get-WMIObject', 'Get-ACL'
}
## Name des neuen Moduls:
$guid = [Guid]::NewGuid().toString('d')
$ModuleName = 'Role{0}_{1}' -f $Name,$guid
$modulePath = "$env:programfiles\WindowsPowerShell\Modules\$ModuleName"
## Modul herstellen:
New-Item -Path "$modulePath\RoleCapabilities" -ItemType Directory -Force
New-PSRoleCapabilityFile -Path "$modulePath\RoleCapabilities\$Name.psrc" @Config
New-ModuleManifest -Path "$modulePath\$ModuleName.psd1"
#endregion

#region Capability ManageService
## Name der Fähigkeit:
$Name = 'ManageService'
## Konfiguration definieren:
$Config = @{
    VisibleCmdlets = 'Microsoft.PowerShell.Management\*-Service'
}
## Name des neuen Moduls:
$guid = [Guid]::NewGuid().toString('d')
$ModuleName = 'Role{0}_{1}' -f $Name,$guid
$modulePath = "$env:programfiles\WindowsPowerShell\Modules\$ModuleName"
## Modul herstellen:
New-Item -Path "$modulePath\RoleCapabilities" -ItemType Directory -Force
New-PSRoleCapabilityFile -Path "$modulePath\RoleCapabilities\$Name.psrc" @Config
New-ModuleManifest -Path "$modulePath\$ModuleName.psd1"
#endregion

#region Capability ManageLog
## Name der Fähigkeit:
$Name = 'ManageLog'
## Konfiguration definieren:
$Config = @{
    VisibleCmdlets = 'Microsoft.PowerShell.Management\*-EventLog'
}
## Name des neuen Moduls:
$guid = [Guid]::NewGuid().toString('d')
$ModuleName = 'Role{0}_{1}' -f $Name,$guid
$modulePath = "$env:programfiles\WindowsPowerShell\Modules\$ModuleName"
## Modul herstellen:
New-Item -Path "$modulePath\RoleCapabilities" -ItemType Directory -Force
New-PSRoleCapabilityFile -Path "$modulePath\RoleCapabilities\$Name.psrc" @Config
New-ModuleManifest -Path "$modulePath\$ModuleName.psd1"
#endregion