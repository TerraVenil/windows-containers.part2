param (
    [Parameter(Mandatory=$true)]
    [string]$tokenCode
)

Try
{
    $awsCredential = Get-AWSCredential -ListProfileDetail | Select-Object -First 1

    Set-AWSCredential -ProfileName $awsCredential.ProfileName

    $mfaDevice = Get-IAMMFADevice

    $sessionToken = Get-STSSessionToken -DurationInSeconds 3600 -SerialNumber $mfaDevice.SerialNumber -TokenCode $tokenCode

    $env:AWS_SESSION_TOKEN     = $sessionToken.SessionToken
    $env:AWS_ACCESS_KEY_ID     = $sessionToken.AccessKeyId
    $env:AWS_SECRET_ACCESS_KEY = $sessionToken.SecretAccessKey

    Write-Host "AWS environment variables exported"
}
Catch
{
    $ErrorMessage = $_.Exception.Message
    Write-Host "Failed to get STS session token with message. $ErrorMessage"
}