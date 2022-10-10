using BusinessLayer.Entities;

namespace DataLayer.Dtos
{
    public class CartItemDto
    {
        public ItemDto Item { get; set; }
        public int Quantity { get; set; }
    }
}
