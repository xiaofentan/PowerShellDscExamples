Configuration WebServer {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$ComputerName
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration

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
		WindowsFeature Management {
            Ensure = "Present"
            Name = "Web-Mgmt-Service"
            DependsOn = '[WindowsFeature]IIS'
        }
		WindowsFeature ManagementConsole {
            Ensure = "Present"
            Name = "Web-Mgmt-Console"
            DependsOn = '[WindowsFeature]Management'
        }
    }
}

WebServer -OutputPath .\MOF -ComputerName 'localhost'
