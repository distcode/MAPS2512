enum CPUType {
    AMD = 1
    Intel = 2
    SOC = 4
    Mx = 8
    SnapDragon = 16
}

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

class Server : HostInfo {
    [int]$Cores
    [CPUType]$CPU
}

class PC : Hostinfo {
    [bool]$GPU = $true
}



$myObject = [HostInfo]::new()

return

$myObject.Hostname = 'Cl1'
$myObject.RAM = (8 * 1GB)

