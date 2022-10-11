using BusinessLayer.Entities;
using BusinessLayer.Interfaces;

namespace BusinessLayer.Services
{
    internal sealed class CartingService : ICartingService
    {
        private readonly ICartRepository _repository;

        public CartingService(ICartRepository repository)
        {
            _repository = repository;
        }
        public void AddItemToCart(int cartId, Item item, int quantity)
        {
            var cart = _repository.GetCart(cartId);
            cart.AddItem(item, quantity);
            _repository.UpdateCart(cart);
        }

        public void CreateCart(int id)
        {
            _repository.CreateCart(id);
        }

        public List<CartItem> GetCartItems(int cartId)
        {
            var cart = _repository.GetCart(cartId);
            return cart.CartItems;
        }

        public void RemoveItemFromCart(int cartId, Item item, int quantity)
        {
            var cart = _repository.GetCart(cartId);
            cart.RemoveItem(item, quantity);
            if (cart.CartItems.Any())
            {
                _repository.UpdateCart(cart);
            }
            else
            {
                _repository.RemoveCart(cart);
            }
            
        }
    }
}
