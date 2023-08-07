$hostsPath="C:\Windows\System32\drivers\etc\hosts"
$blockedDomains = @(
"google.com"
"google.co.uk"
)

foreach ($domain in $blockedDomains){
    Add-Content -Path "$($hostsPath)" -Value "0.0.0.0 $($domain)" -Encoding ASCII
}