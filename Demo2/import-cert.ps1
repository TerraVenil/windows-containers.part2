$certName                               = 'cert.pfx'
$ENV_CERTIFICATE_CONTENT                = 'CERTIFICATE_CONTENT'
$ENV_CERTIFICATE_SECURE_PASSWORD_STRING = 'CERTIFICATE_SECURE_PASSWORD_STRING'

$certContentPath                        = 'env:\{0}' -f $ENV_CERTIFICATE_CONTENT
$certSecurePasswordStringPath           = 'env:\{0}' -f $ENV_CERTIFICATE_SECURE_PASSWORD_STRING

$cert           = (Get-ChildItem -Path $certContentPath).Value | New-Item -Path . -Name $certName -Type File -Force
$securePassword = (Get-ChildItem -Path $certSecurePasswordStringPath).Value | ConvertTo-SecureString -Force -AsPlainText

Import-PfxCertificate -Password $securePassword -CertStoreLocation Cert:\LocalMachine\My -FilePath $certName