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
        public void AddItemToCart(int cartId, Item item, int quantity)
        {
            FluentValidation.Results.ValidationResult validationResult = Item.Validator.Validate(item);
            if (!validationResult.IsValid)
            {
                throw new CartException(string.Join(Environment.NewLine, validationResult.Errors.Select(e => e.ErrorMessage)));
            }

            var cart = _repository.GetCart(cartId);
            if (cart == null)
            {
                cart = _repository.CreateCart(cartId);
            }

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
            if (cart == null)
            {
                throw CartException.CartNotFound;
            }
            return cart.CartItems;
        }

        public void RemoveItemFromCart(int cartId, Item item, int quantity)
        {
            var cart = _repository.GetCart(cartId);
            if (cart == null)
            {
                throw CartException.CartNotFound;
            }

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
