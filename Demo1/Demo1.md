```Get-Service | Where-Object {$_.Status -eq "Running"} | measure```

```Get-Service | Where-Object {$_.Status -eq "Stopped"} | measure```