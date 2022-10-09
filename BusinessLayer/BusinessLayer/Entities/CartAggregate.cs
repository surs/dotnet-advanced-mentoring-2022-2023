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
            throw new NotImplementedException();
        }

        public void RemoveItem(Item item, int quantity)
        {
            throw new NotImplementedException();
        }
    }
}
