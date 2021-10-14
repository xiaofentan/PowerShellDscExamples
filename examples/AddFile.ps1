Configuration AddFile {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$ComputerName
    )

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node $ComputerName
    {
        File TestFile
        {
            Type = 'File'
            Ensure = 'Present'
            DestinationPath = 'C:\TestFolder\TestFile1.txt'
            Contents = 'My First Configuration'
            Force = $true
        }
    }
}

AddFile -OutputPath .\MOF -ComputerName 'localhost'
