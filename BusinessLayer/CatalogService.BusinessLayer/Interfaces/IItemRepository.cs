using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface IItemRepository
    {
        Item GetItem(int id);
        List<Item> GetAllCategories();
        Item AddItem(Item Item);
        void UpdateItem(Item Item);
        bool DeleteItem(int id);
    }
}
