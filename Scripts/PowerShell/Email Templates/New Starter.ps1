[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $user,
    [Parameter(Mandatory=$true)]
    [AllowEmptyString()]
    [string]
    $cc
)


$sender = "$($env:UserName)@example.domain.com"
$recipient = "$($user)@example.domain.com"
$user = $user -Replace "\.", " "
$user = [System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($user)
$userFirstName, $userLastname = $user -split ' ', 2

$sentBy = $env:UserName
$sentBy = $sentBy -Replace "\.", " "
$sentBy = [System.Globalization.CultureInfo]::CurrentCulture.TextInfo.ToTitleCase($sentBy)
$sentByFirstName, $sentByLastName = $sentBy -split ' ', 2

$subject = "New Starter details for $($user)"
$fileName = "New Starter.html"
$body = Get-Content -Path "$($env:USERPROFILE)\Desktop\Scripts\HTML\$($fileName)"
$body = "Hi $($userFirstName),<p>Login details below,</p><p>EMAIL:&#160;<b>$($recipient)</b><br>USER:&#160;<b>$($recipient.Replace('@example.domain.com',''))</b><br>" + ($body | Out-String) + $($sentByFirstName)
$credential = Get-Credential

Send-MailMessage -From $sender -To $recipient -Cc "copied.recipient@example.domain.com", $($cc+"@example.domain.com") -Subject $subject -Body $body -BodyAsHtml -Attachment "C:\New Starter Onboarding\New Starter Induction.pdf" -SmtpServer "smtp.office365.com" -UseSsl -Credential $credential