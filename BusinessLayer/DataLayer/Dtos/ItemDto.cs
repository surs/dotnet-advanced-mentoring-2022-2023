namespace DataLayer.Dtos
{
    internal sealed class ItemDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ImageDto Image { get; set; }
        public decimal Price { get; set; }
    }
}

