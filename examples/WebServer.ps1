Configuration WebServer {
    param (
        [Parameter(Mandatory=$ture)]
        [string[]]$ComputerName
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName WebAdministration

    Node $ComputerName
    {
        WindowsFeature IIS {
            Ensure = "Present"
            Name = "Web-Server"
        }
        WindowsFeature NetExtens4 {
            Ensure = "Present"
            Name = "Web-Net-Ext45"
            DependsOn = '[WindowsFeature]IIS'
        }
        WindowsFeature AspNet45 {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
            DependsOn = '[WindowsFeature]IIS'
        }
    }
}

WebServer -OutputPath .\MOF -ComputerName 'localhost'
