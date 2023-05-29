param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $user,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $password
)
Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Reset

$groups = @(
"CN=Example Group 1,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 2,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 3,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com",
"CN=Example Group 4,OU=Groups,OU=Accounts,OU=GBR,DC=EU,DC=example,DC=com"
)


foreach ($group in $groups)
{
    $CurrentGroup = Get-ADGroup -Identity $group -ErrorAction SilentlyContinue
    if($CurrentGroup -ne $null)
    {
        Add-ADGroupMember -Identity $currentGroup.Name -Members $user
        $CurrentGroup = $null
    }
}