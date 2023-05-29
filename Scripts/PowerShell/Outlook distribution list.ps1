#Add-PSSnapin Microsoft.Exchange.Management.PowerShell.E2010

#$filname="C:\Users\saif.uddin.ext\Desktop\Scripts\Distribution List.csv"

#Import-CSV $filname | ForEach {Add-DistributionGroupMember -Identity "AD Office Members Group" -Member $_.Name}

#$users = import-csv "$($env:USERPROFILE)\Desktop\Scripts\Distribution List.csv"
#ForEach ($user in $users){
#    $username = $($user.username)
#    $group = $($user.group)
#    $email = $($username + "@example.com ")
#    Set-ADUser $username -UserPrincipalName $email
#    Add-DistributionGroupMember -Identity $group -Member $email
#    }

Add-DistributionGroupMember -Identity $group -Member $email