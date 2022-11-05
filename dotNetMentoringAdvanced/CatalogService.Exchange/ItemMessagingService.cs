using CatalogService.BusinessLayer.Interfaces;
using CatalogService.BusinessLayer.EventArgs;
using AutoMapper;
using CatalogService.BusinessLayer.Entities;
using CatalogService.Exchange.Dtos;
using Newtonsoft.Json;
using System.Text;
using RabbitMQ.Client;
using CatalogService.Exchange.Interfaces;

namespace CatalogService.Exchange
{
    internal sealed class ItemMessagingService : IItemMessagingService
    {
        private readonly IItemService _itemService;
        private readonly IMessagingConfiguration _messagingConfiguration;
        private readonly IMapper _mapper;

        public ItemMessagingService(IItemService itemService, IMessagingConfiguration messagingConfiguration)
        {
            _itemService = itemService;
            _messagingConfiguration = messagingConfiguration;
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
            var message = GetMessage(eventArgs.ChangedItem);
            channel.BasicPublish(_messagingConfiguration.Exchange,
                string.Empty,
                null,
                message);
        }

        private byte[] GetMessage(Item item)
        {
            var dto = _mapper.Map<ItemDto>(item);
            var serialized = JsonConvert.SerializeObject(dto);
            return Encoding.UTF8.GetBytes(serialized);
        }
    }
}