using CatalogService.BusinessLayer.Interfaces;
using CatalogService.BusinessLayer.EventArgs;
using AutoMapper;
using CatalogService.BusinessLayer.Entities;
using CatalogService.Exchange.Dtos;
using Newtonsoft.Json;
using System.Text;
using RabbitMQ.Client;
using CatalogService.Exchange.Interfaces;
using Microsoft.ApplicationInsights;

namespace CatalogService.Exchange
{
    internal sealed class ItemMessagingService : IItemMessagingService
    {
        private readonly IItemService _itemService;
        private readonly IMessagingConfiguration _messagingConfiguration;
        private readonly TelemetryClient? _telemetry;
        private readonly IMapper _mapper;

        public ItemMessagingService(IItemService itemService, IMessagingConfiguration messagingConfiguration, TelemetryClient? telemetry)
        {
            _itemService = itemService;
            _messagingConfiguration = messagingConfiguration;
            _telemetry = telemetry;
            _mapper = EntitiesMapping.ConfigureAndCreateMapper();
        }

        public void Start()
        {
            _itemService.OnItemChanged += SendItemChangeUpdate;
        }

        public void Stop()
        {
            _itemService.OnItemChanged -= SendItemChangeUpdate;
        }

        public void SendItemChangeUpdate(object? sender, ItemChangedEventArgs eventArgs)
        {
            using var connection = _messagingConfiguration.ConnectionFactory.CreateConnection();
            using var channel = connection.CreateModel();
            var message = GetMessage(eventArgs);
            TrackEvent(eventArgs);
            channel.BasicPublish(exchange: _messagingConfiguration.Exchange,
                routingKey: string.Empty,
                basicProperties: null,
                body: message);
        }

        private IDictionary<string, string> GetEventProperties(ItemChangedEventArgs eventArgs) =>
            new Dictionary<string, string>
            {
                ["sender"] = this.ToString() ?? string.Empty,
                ["correlation"] = eventArgs.Correlation ?? string.Empty,
                ["payload"] = JsonConvert.SerializeObject(eventArgs.ChangedItem)
            };

        private void TrackEvent(ItemChangedEventArgs eventArgs)
        {
            if (_telemetry != null)
            {
                _telemetry.TrackEvent("itemChangedSent", properties: GetEventProperties(eventArgs));
            }
        }

        private byte[] GetMessage(ItemChangedEventArgs data)
        {
            var dto = _mapper.Map<ItemDto>(data.ChangedItem);
            dto.Correlation = data.Correlation;
            var serialized = JsonConvert.SerializeObject(dto);
            return Encoding.UTF8.GetBytes(serialized);
        }
    }
}