using BusinessLayer.Entities;

namespace BusinessLayer.Interfaces
{
    public interface ICartingService
    {
        void CreateCart(int id);
        List<CartItem> GetCartItems(int id);
        void AddItemToCart(int cartId, Item item, int quantity);
        void RemoveItemFromCart(int cartId, Item item, int quantity);
    }
}
