using CatalogService.Exchange.Interfaces;
using Microsoft.Extensions.Configuration;
using RabbitMQ.Client;

namespace CatalogService.Exchange
{
    internal sealed class MessagingConfiguration : IMessagingConfiguration
    {
        public MessagingConfiguration(IConfiguration configuration)
        {
            //var rabbitConfig = configuration.GetValue<RabbitMqConfiguration>("RabbitMQ");
            ConnectionFactory = new ConnectionFactory { HostName = "localhost" };
            Exchange = "dotnetadvanced.items";
        }

        public ConnectionFactory ConnectionFactory { get; init; }
        public string Exchange { get; init; }
    }
}
