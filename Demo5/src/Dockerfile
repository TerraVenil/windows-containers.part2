FROM mcr.microsoft.com/dotnet/framework/runtime:4.8-windowsservercore-1909

WORKDIR /app

COPY src/TechTalk.RedisIntegration.Entrypoint/bin/Debug/net472 ./

ENTRYPOINT ["cmd.exe", "/k", "TechTalk.RedisIntegration.Entrypoint.exe"]