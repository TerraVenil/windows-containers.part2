## How to run integration tests locally?

```docker-compose --file integration-test-compose.yml build --force-rm --parallel```

```docker-compose --file integration-test-compose.yml up --force-recreate```

```docker-compose --file integration-test-compose.yml down -v```