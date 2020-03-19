FROM mcr.microsoft.com/dotnet/core/sdk:3.1.102-nanoserver-1909 AS test-env

WORKDIR /app

RUN mkdir TestResults

COPY tests/TechTalk.RedisIntegration.Tests/bin/Debug/netcoreapp3.1 ./

ENTRYPOINT [ "dotnet", "vstest", \
    "--logger:trx", "--testadapterpath:.", \
    "/resultsdirectory:TestResults", "TechTalk.RedisIntegration.Tests.dll" \
    ]