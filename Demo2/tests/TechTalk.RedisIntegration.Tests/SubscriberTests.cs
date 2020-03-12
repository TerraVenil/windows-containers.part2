using FluentAssertions;
using StackExchange.Redis;
using System;
using System.Collections.Concurrent;
using System.Threading.Tasks;
using Xunit;

namespace RedisIntegrationTests
{
    public class SubscriberTests
    {
        [Fact]
        public async Task SubscribeToRedis_ShouldRecieveMessages()
        {
            ConnectionMultiplexer redis = ConnectionMultiplexer.Connect("redis:6379");
            ConcurrentBag<string> messages = new ConcurrentBag<string>();

            ISubscriber subscriber = redis.GetSubscriber();

            await subscriber.SubscribeAsync("techtalks:conversations", (channel, message) =>
            {
                messages.Add(message);
            });

            await Task.Delay(TimeSpan.FromSeconds(5));

            messages.Should().NotBeEmpty();
        }
    }
}
