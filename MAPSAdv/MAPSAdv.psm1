class HostInfo {
    # Properties
    [string]$Hostname
    [Int64]$RAM
    [datetime]$Creation

    # Methods
    [string] ShutDown ([string]$Type, [int]$Timeout) {
        $result = "Der Rechner $($this.Hostname) wird in $($Timeout) Sekunden beendet $($Type)."
        return $result
    }
    
    [double] RAMGB () {
        return ($this.RAM / 1GB)
    }

    # Method overload
    [void] ShutDown ([int]$TimeOut) {
        "Der Rechner $($this.Hostname) wird in $($Timeout) Sekunden beendet POWEROFF."
        return
    }

    # Constructor(s)
    HostInfo () {
        $this.Creation = Get-Date
    }

    HostInfo ([string]$Name) {
        $this.Creation = Get-Date
        $this.Hostname = $Name
    }

    HostInfo ([string]$Name, [Int64]$RAM) {
        $this.Creation = Get-Date
        $this.Hostname = $Name
        $this.RAM = $RAM
    }
}

enum HostinfoType {
    Desktop
    Server
    Phone
    Tablet
}

[Flags()] enum HostinfoFeatures {
    None = 0
    Touchscreen = 1
    Webcam = 2
    Microphone = 4
    GPS = 8
    Pen = 16
    FaceRecognition = 32
}

. $PSScriptRoot\StartFeierabend.ps1
. $PSScriptRoot\WriteHello.ps1

$tempVariable = Get-Random -Minimum 1 -Maximum 10
New-Variable -Name MAPSVariable -Value $tempVariable

Set-Alias -Name sos -Value Get-Help

Update-TypeData $PSScriptRoot\Fileinfo.types.ps1xml
Update-FormatData $PSScriptRoot\Fileinfo.format.ps1xml


[psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Add('HostInfo',[HostInfo])
[psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Add('HostinfoType',[HostinfoType])
[psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Add('HostinfoFeatures',[HostinfoFeatures])

Export-ModuleMember -Variable 'MapsVariable'
Export-ModuleMember -Function @('Write-Hello','Start-Feierabend')
Export-ModuleMember -Alias sos
