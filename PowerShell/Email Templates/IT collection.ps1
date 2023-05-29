param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $user
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

$subject = "IT collection for $($user)"
$fileName = "IT collection.html"
$body = Get-Content -Path "$($env:USERPROFILE)\Desktop\Scripts\HTML\$($fileName)"
$body = "Hi $($userFirstName)," + ($body | Out-String) + $($sentByFirstName)
$credential = Get-Credential

Send-MailMessage -From $sender -To $recipient -Cc "copied.recipient@example.domain.com" -Subject $subject -Body ($body | Out-String) -BodyAsHtml -SmtpServer "smtp.office365.com" -UseSsl -Credential $credential