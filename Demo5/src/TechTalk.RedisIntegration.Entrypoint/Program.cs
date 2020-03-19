using StackExchange.Redis;
using System;
using System.Threading.Tasks;

namespace RedisIntegrationTests.Entrypoint
{
    class Program
    {
        static async Task Main(string[] args)
        {
            ConnectionMultiplexer redis = ConnectionMultiplexer.Connect("redis:6379");

            ISubscriber subscriber = redis.GetSubscriber();
            IDatabase database = redis.GetDatabase();

            while(true)
            {
                await subscriber.PublishAsync("techtalks:conversation", $"Say, hi!");

                await database.StringSetAsync($"{Guid.NewGuid().ToString("N")}", DateTime.UtcNow.Ticks);

                await Task.Delay(TimeSpan.FromSeconds(10));
            }
        }
    }
}
