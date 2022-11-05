using CatalogService.BusinessLayer.EventArgs;

namespace CatalogService.Exchange.Interfaces
{
    public interface IItemMessagingService
    {
        void SendItemChangeUpdate(object? sender, ItemChangedEventArgs eventArgs);
        void Start();
        void Stop();
    }
}