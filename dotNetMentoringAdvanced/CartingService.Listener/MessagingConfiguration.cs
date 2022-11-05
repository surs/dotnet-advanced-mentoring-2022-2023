using RabbitMQ.Client;

namespace CartingService.Listener
{
    internal sealed class MessagingConfiguration : IMessagingConfiguration
    {
        public MessagingConfiguration()
        {
            //var rabbitConfig = configuration.GetValue<RabbitMqConfiguration>("RabbitMQ");
            ConnectionFactory = new ConnectionFactory { HostName = "localhost" };
            Queue = "dotnetadvanced.basket.i0";
        }

        public ConnectionFactory ConnectionFactory { get; init; }
        public string Queue { get; init; }
    }
}
