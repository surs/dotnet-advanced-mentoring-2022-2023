using CartingService.BusinessLayer.Entities;

namespace CartingService.BusinessLayer.Interfaces
{
    public interface ICartingService
    {
        void CreateCart(Guid cartKey);
        List<CartItem> GetCartItems(Guid cartKey);
        void AddItemToCart(Guid cartKey, Item item, int quantity);
        void RemoveItemFromCart(Guid cartKey, Item item, int quantity);
        void RemoveItemFromCart(Guid cartKey, int itemId, int quantity);
    }
}
