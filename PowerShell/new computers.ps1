#param(
#    [Parameter(Mandatory=$true)]
#    [ValidateNotNullOrEmpty()]
#    [string]
#    $COMPUTER
#)

#Add-ADGroupMember -Identity "Example Group 1" -Members (Get-ADComputer $COMPUTER) #, (Get-ADComputer ComputerName1) #, (Get-ADComputer ComputerName2) ...

$groups = @(
"CN=Example Group 1,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 2,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 3,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 4,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com"
)

$computers = @(
"ComputerName1",
"ComputerName2",
"ComputerName3",
"ComputerName4"
)

foreach ($group in $groups)
{
    $CurrentGroup = Get-ADGroup -Identity $group -ErrorAction SilentlyContinue
    if($CurrentGroup -ne $null)
    {
        foreach ($computer in $computers)
        {
            Add-ADGroupMember -Identity $currentGroup.Name -Members (Get-ADComputer $computer)
        }
        $CurrentGroup = $null
    }
}