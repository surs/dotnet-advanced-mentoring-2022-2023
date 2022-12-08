using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.EventArgs;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface IItemService
    {
        event EventHandler<ItemChangedEventArgs> OnItemChanged;
        List<Item> GetItems();
        Item GetItem(int id);
        Item AddItem(Item Item);
        Item AddItem(string name, string? description, Uri? image,
            Category category, decimal price, int amount);
        void UpdateItem(int id, string name, string? description, Uri? image,
            Category category, decimal price, int amount, string? correlation = null);
        void DeleteItem(int id);
    }
}
