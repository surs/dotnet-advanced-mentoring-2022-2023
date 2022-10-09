using BusinessLayer.Entities;

namespace BusinessLayer.Interfaces
{
    internal interface ICartingService
    {
        List<CartItem> GetCartItems(int id);
        void AddItemToCart(int cartId, Item item, int quantity);
        void RemoveItemFromCart(int cartId, Item item, int quantity);
    }
}
