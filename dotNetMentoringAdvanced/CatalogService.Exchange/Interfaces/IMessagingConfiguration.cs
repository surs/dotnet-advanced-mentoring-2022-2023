using RabbitMQ.Client;

namespace CatalogService.Exchange.Interfaces
{
    internal interface IMessagingConfiguration
    {
        ConnectionFactory ConnectionFactory { get; init; }
        string Exchange { get; init; }
    }
}