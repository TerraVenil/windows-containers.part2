$ENV_AWS_PRIV_LAUNCH_KEY = 'AWS_PRIV_LAUNCH_KEY'

$awsPrivLaunchKeyPath    = 'env:\{0}' -f $ENV_AWS_PRIV_LAUNCH_KEY

Try
{
    if (-Not (Test-Path $awsPrivLaunchKeyPath))
    {
        Write-Host 'Please specify $AWS_PRIV_LAUNCH_KEY to *.pem'
    }
    else
    {
        $scriptPath    = Split-Path $MyInvocation.InvocationName
        $privLaunchKey = (Get-ChildItem -Path $awsPrivLaunchKeyPath).Value

        Invoke-Expression -Command $scriptPath\aws_cli_configure.ps1
        
        $port                 = 3389

        $instance             = (Get-EC2Instance -AccessKey $env:AWS_ACCESS_KEY_ID -SecretKey $env:AWS_SECRET_ACCESS_KEY -SessionToken $env:AWS_SESSION_TOKEN).Instances
        $ipAddress            = $instance.PublicIpAddress
        $password             = Get-EC2PasswordData -InstanceId $instance.InstanceId -PemFile $privLaunchKey

        Write-Host "ContainerId" $containerId - $ipAddress - $password

        cmdkey /generic:$ipAddress /user:Administrator /pass:$password

        mstsc /v:${ipAddress}:$port
    }
}
Catch
{
    $ErrorMessage = $_.Exception.Message
    Write-Host "Failed to create RDP connection with message. $ErrorMessage"
}