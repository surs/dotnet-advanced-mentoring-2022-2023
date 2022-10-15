using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;

namespace CatalogService.BusinessLayer.Services
{
    internal sealed class ItemService : IItemService
    {
        private readonly IItemRepository _itemRepository;

        public ItemService(IItemRepository itemRepository)
        {
            _itemRepository = itemRepository;
        }

        public Item AddItem(Item Item)
        {
            FluentValidation.Results.ValidationResult validationResult = Item.Validator.Validate(Item);
            if (!validationResult.IsValid)
            {
                throw new CatalogException(string.Join(Environment.NewLine, validationResult.Errors.Select(e => e.ErrorMessage)));
            }

            return _itemRepository.AddItem(Item);
        }

        public Item AddItem(string name, string? description, Uri image, Category category, decimal price, int amount)
        {
            var Item = new Item(0, name, description, image, category, price, amount);
            return AddItem(Item);
        }

        public void DeleteItem(int id)
        {
            var deleted = _itemRepository.DeleteItem(id);
            if (!deleted)
            {
                throw CatalogException.ItemNotFound;
            }
        }

        public List<Item> GetCategories()
        {
            return _itemRepository.GetAllItems();
        }

        public Item GetItem(int id)
        {
            var Item = _itemRepository.GetItem(id);
            if (Item == null)
            {
                throw CatalogException.ItemNotFound;
            }

            return Item;
        }

        public void UpdateItem(int id, string name, string? description, Uri image, Category category, decimal price, int amount)
        {
            var Item = new Item(id, name, description, image, category, price, amount);
            _itemRepository.UpdateItem(Item);
        }

    }
}
