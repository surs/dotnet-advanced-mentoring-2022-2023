using RabbitMQ.Client;

namespace CartingService.Listener
{
    internal interface IMessagingConfiguration
    {
        ConnectionFactory ConnectionFactory { get; init; }
        string Queue { get; init; }
    }
}