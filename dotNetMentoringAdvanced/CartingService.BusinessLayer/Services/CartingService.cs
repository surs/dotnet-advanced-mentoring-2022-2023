using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Exceptions;
using CartingService.BusinessLayer.Interfaces;

namespace CartingService.BusinessLayer.Services
{
    internal sealed class CartingService : ICartingService
    {
        private readonly ICartRepository _repository;

        public CartingService(ICartRepository repository)
        {
            _repository = repository;
        }
        public void AddItemToCart(Guid cartKey, Item item, int quantity)
        {
            if (quantity <= 0)
            {
                throw new CartException("Cannot add less than 1 item to cart");
            }

            FluentValidation.Results.ValidationResult validationResult = Item.Validator.Validate(item);
            if (!validationResult.IsValid)
            {
                throw new CartException(string.Join(Environment.NewLine, validationResult.Errors.Select(e => e.ErrorMessage)));
            }

            var cart = _repository.GetCart(cartKey);
            if (cart == null)
            {
                cart = _repository.CreateCart(cartKey);
            }

            cart.AddItem(item, quantity);
            _repository.UpdateCart(cart);
        }

        public void CreateCart(Guid cartKey)
        {
            _repository.CreateCart(cartKey);
        }

        public List<CartItem> GetCartItems(Guid cartKey)
        {
            var cart = _repository.GetCart(cartKey);
            if (cart == null)
            {
                throw CartException.CartNotFound;
            }
            return cart.CartItems;
        }

        public void RemoveItemFromCart(Guid cartKey, Item item, int quantity)
        {
            var cart = _repository.GetCart(cartKey);
            if (cart == null)
            {
                throw CartException.CartNotFound;
            }

            RemoveItem(item, quantity, cart);
        }

        public void RemoveItemFromCart(Guid cartKey, int itemId, int quantity)
        {
            var cart = _repository.GetCart(cartKey);
            if (cart == null)
            {
                throw CartException.CartNotFound;
            }

            var item = cart.CartItems.FirstOrDefault(i => i.Item.Id == itemId);
            if (item == null)
            {
                return;
            }

            RemoveItem(item.Item, quantity, cart);
        }

        public void UpdateItemsInBaskets(int itemId, string name, string? description, string? imageUrl, decimal price)
        {
            _repository.UpdateBasketsItems(itemId, name, description, imageUrl, price);
        }

        private void RemoveItem(Item item, int quantity, CartAggregate cart)
        {
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
