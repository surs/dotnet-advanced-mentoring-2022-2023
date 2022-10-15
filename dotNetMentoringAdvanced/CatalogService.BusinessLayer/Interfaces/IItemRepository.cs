using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface IItemRepository
    {
        Item GetItem(int id);
        List<Item> GetAllItems();
        Item AddItem(Item Item);
        bool UpdateItem(Item Item);
        bool DeleteItem(int id);
    }
}
