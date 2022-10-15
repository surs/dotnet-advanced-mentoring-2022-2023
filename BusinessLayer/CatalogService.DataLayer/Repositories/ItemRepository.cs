using AutoMapper;
using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.DataLayer.Interfaces;
using Business = CatalogService.BusinessLayer.Entities;
using Data = CatalogService.DataLayer.Model;

namespace CatalogService.DataLayer.Repositories
{
    internal sealed class ItemRepository : IItemRepository
    {
        private readonly ICatalogContext _context;
        private readonly IMapper _mapper;

        public ItemRepository(ICatalogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public Business.Item AddItem(Business.Item item)
        {
            var itemDto = _mapper.Map<Data.Item>(item);
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
            return _mapper.Map<List<Business.Item>>(_context.Items.ToList());
        }

        public Business.Item GetItem(int id)
        {
            return _mapper.Map<Business.Item>(_context.Items.FirstOrDefault(c => c.Id == id));
        }

        public bool UpdateItem(Item item)
        {
            var entity = _context.Items.Update(_mapper.Map<Data.Item>(item));
            _context.SaveChanges();
            return entity != null;
        }
    }
}
