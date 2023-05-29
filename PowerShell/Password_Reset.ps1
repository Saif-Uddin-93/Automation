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

# Set the user's password to the new password
Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Reset