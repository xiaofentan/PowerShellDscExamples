Configuration AddFile {
    param (
        [Parameter(Mandatory=$ture)]
        [string[]]$ComputerName
    )

    Import-DscResource -ModuleName 'PSDscResources'

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
