using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface IItemService
    {
        List<Item> GetCategories();
        Item GetItem(int id);
        Item AddItem(Item Item);
        Item AddItem(string name, string? description, Uri image, 
            Category category, decimal price, int amount);
        void UpdateItem(int id, string name, string? description, Uri image,
            Category category, decimal price, int amount);
        void DeleteItem(int id);
    }
}
