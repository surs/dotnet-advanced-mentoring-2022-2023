namespace CartingService.DataLayer.Dtos
{
    internal sealed class CartItemDto
    {
        public ItemDto Item { get; set; }
        public int Quantity { get; set; }
    }
}
