#
# Demonstration taken from 'PowerShell 5.0 - Book' by Tobias Weltner
#
# JEA -Simple
#

# Prerequisites

## Users & group
$jeaAdmin = New-ADGroup -Name JEA_Admin -GroupScope DomainLocal -PassThru
$password = ConvertTo-SecureString -String 'Pa55w.rd' -AsPlainText -Force
$operator = New-ADUser -Name TestOperator -AccountPassword $password -PassThru
Enable-ADAccount -Identity $operator
$normaluser = New-ADUser -Name Normaluser -AccountPassword $password -PassThru
Enable-ADAccount -Identity $normaluser
Add-ADGroupMember -Identity $jeaAdmin -Members $operator

## Remoting aktivieren & Testen
Enable-PSRemoting
winrm quickconfig

# JEA-Endpunkt einrichten

## Pfadname zu einer neuen pssc-Datei festlegen
if (!(Test-Path -Path "C:\maps2512\Temp")) {
    New-Item -Path "C:\maps2512\Temp" -ItemType Directory
}
$Path = "C:\maps2512\Temp\jea1.pssc"

## Get-UserInfo liefert den Wert von $PSSenderInfo zurück
## darin ist der Name des aufrufenden Anwenders zu finden
$getUserInfo = @{
    Name='Get-UserInfo'
    ScriptBlock=
    {
        $PSSenderInfo
    }
}

## Datei anlegen
New-PSSessionConfigurationFile -Path $Path `
                               -SessionType RestrictedRemoteServer `
                               -LanguageMode NoLanguage `
                               -ExecutionPolicy Restricted `
                               -RunAsVirtualAccount `
                               -VisibleCmdlets Microsoft.PowerShell.Management\*-Service, Get-* `
                               -ModulesToImport Microsoft.* `
                               -FunctionDefinitions $getUserInfo

## Endpunkt anleg
Register-PSSessionConfiguration -Path $Path -Name JEA1 -Force

## JEA-Gruppe berechtigen
Set-PSSessionConfiguration -Name JEA1 -ShowSecurityDescriptorUI -Force


# HINWEIST: Bei Anlegen erscheint ein Berechtigungsdialog. Hier soll nur die Gruppe JEA_Admin 'Full Control' erhalten.


