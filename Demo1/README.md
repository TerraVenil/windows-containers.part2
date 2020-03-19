Show all running services

```Get-Service | Where-Object {$_.Status -eq "Running"} | measure```

Show all stopped services

```Get-Service | Where-Object {$_.Status -eq "Stopped"} | measure```