using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.EventArgs
{
    public class ItemChangedEventArgs : System.EventArgs
    {
        public Item? ChangedItem { get; set; }
        public string? Correlation { get; set; }
    }
}
