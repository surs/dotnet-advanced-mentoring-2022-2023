using AutoMapper;
using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.DataLayer.Interfaces;
using Microsoft.EntityFrameworkCore;
using Business = CatalogService.BusinessLayer.Entities;
using Data = CatalogService.DataLayer.Model;

namespace CatalogService.DataLayer.Repositories
{
    internal sealed class ItemRepository : IItemRepository
    {
        private readonly ICatalogContext _context;
        private readonly IMapper _mapper;

        public ItemRepository(ICatalogContext context)
        {
            _context = context;
            _mapper = EntitiesMapping.ConfigureAndCreateMapper();
        }

        public Business.Item AddItem(Business.Item item)
        {
            var itemDto = _mapper.Map<Data.Item>(item);
            var category = _context.Categories.FirstOrDefault(c => c.Id == itemDto.CategoryId);
            if (category == null)
            {
                throw new CatalogException("Category not found");
            }

            itemDto.Category = category;
            var newItem = _context.Items.Add(itemDto);
            _context.SaveChanges();
            return _mapper.Map<Business.Item>(newItem.Entity);
        }

        public bool DeleteItem(int id)
        {
            var item = _context.Items.FirstOrDefault(c => c.Id == id);
            if (item == null)
            {
                return false;
            }

            _context.Items.Remove(item);
            _context.SaveChanges();
            return true;
        }

        public List<Item> GetAllItems()
        {
            var items = _context.Items.Include(i => i.Category).ToList();
            return _mapper.Map<List<Business.Item>>(items);
        }

        public Business.Item GetItem(int id)
        {
            return _mapper.Map<Business.Item>(_context.Items.FirstOrDefault(c => c.Id == id));
        }

        public bool UpdateItem(Item item)
        {
            var entity = _context.Items.SingleOrDefault(i => i.Id == item.Id);
            if(entity == null)
            {
                return false;
            }

            entity.Name = item.Name;
            entity.Description = item.Description;
            entity.CategoryId = item.Category.Id;
            entity.Price = item.Price;
            entity.Amount = item.Amount;
            _context.SaveChanges();
            return true;
        }
    }
}
