$registryPath = "HKLM:\SOFTWARE\NuanCat\Debug"

New-ItemProperty -Path $registryPath -Name "LogFile" -PropertyType DWord -Value 0X01000000 -Force | Out-Null

New-ItemProperty -Path $registryPath -Name "LogDirectory" -Value "C:\Logs" -Force | Out-Null