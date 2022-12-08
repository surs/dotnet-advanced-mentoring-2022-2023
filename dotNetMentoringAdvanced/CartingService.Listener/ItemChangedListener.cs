using AutoMapper;
using CartingService.BusinessLayer.Interfaces;
using CatalogService.Exchange.Dtos;
using Microsoft.ApplicationInsights;
using Newtonsoft.Json;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System.Text;

namespace CartingService.Listener
{
    internal class ItemChangedListener : IDisposable, IItemChangedListener
    {
        private readonly ICartingService _cartingService;
        private readonly IMessagingConfiguration _configuration;
        private readonly TelemetryClient? _telemetry;
        private IBasicConsumer? _consumer;
        private IModel? _channel;
        private IConnection? _connection;
        private bool disposedValue = false;

        public ItemChangedListener(ICartingService cartingService, IMessagingConfiguration configuration, TelemetryClient? telemetryClient)
        {
            _cartingService = cartingService;
            _configuration = configuration;
            _telemetry = telemetryClient;
        }

        public void Start()
        {
            _connection = _configuration.ConnectionFactory.CreateConnection();
            _channel = _connection.CreateModel();
            var eventingConsumer = new EventingBasicConsumer(_channel);
            eventingConsumer.Received += OnItemChangedMessageReceived;
            _consumer = eventingConsumer;
            _channel.BasicConsume(_configuration.Queue, true, _consumer);
        }

        private void OnItemChangedMessageReceived(object? sender, BasicDeliverEventArgs e)
        {
            var body = e.Body.ToArray();
            var message = Encoding.UTF8.GetString(body);
            var itemDto = JsonConvert.DeserializeObject<ItemDto>(message);
            TrackEvent(itemDto);
            _cartingService.UpdateItemsInBaskets(itemDto.Id, itemDto.Name, itemDto.Description, itemDto.ImageUrl, itemDto.Price);

        }

        private void TrackEvent(ItemDto? data)
        {
            if (_telemetry != null)
            {
                _telemetry.TrackEvent("itemChangedReceived", properties: GetEventProperties(data));
            }
        }

        private IDictionary<string, string> GetEventProperties(ItemDto? payload) =>
            new Dictionary<string, string>
            {
                ["sender"] = this.ToString() ?? string.Empty,
                ["correlation"] = payload?.Correlation ?? string.Empty,
                ["payload"] = JsonConvert.SerializeObject(payload)
            };

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {

                }

                _channel?.Dispose();
                _connection?.Dispose();
                disposedValue = true;
            }
        }

        ~ItemChangedListener()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: false);
        }

        public void Dispose()
        {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}