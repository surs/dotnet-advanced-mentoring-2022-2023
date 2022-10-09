namespace BusinessLayer.Entities
{
    public sealed class CartAggregate
    {
        public int Id { get; set; }

        public List<CartItem> CartItems { get; private set; }

        public CartAggregate()
        {
            CartItems = new List<CartItem>();
        }

        public void AddItem(Item item, int quantity)
        {
            var cartItem = CartItems.SingleOrDefault(ci => ci.Item.Id == item.Id);
            if (cartItem != null)
            {
                CartItems.Remove(cartItem);
                cartItem = cartItem with { Quantity = cartItem.Quantity + quantity };                
            }
            else
            {
                cartItem = new CartItem(item, quantity);
            }

            CartItems.Add(cartItem);
        }

        public void RemoveItem(Item item, int quantity)
        {
            var cartItem = CartItems.SingleOrDefault(ci => ci.Item.Id == item.Id);
            if (cartItem == null)
            {
                return;
            }

            CartItems.Remove(cartItem);
            if (cartItem.Quantity - quantity <= 0)
            {
                return ;
            }

            cartItem = cartItem with { Quantity = cartItem.Quantity - quantity };
            CartItems.Add(cartItem);
        }
    }
}
