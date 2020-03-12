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

            while(true)
            {
                await subscriber.PublishAsync("techtalks:conversations", $"Say, hi!");

                await Task.Delay(TimeSpan.FromSeconds(10));
            }
        }
    }
}
