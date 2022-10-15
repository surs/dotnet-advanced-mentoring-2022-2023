using AutoMapper;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.DataLayer.Interfaces;
using Business = CatalogService.BusinessLayer.Entities;
using Data = CatalogService.DataLayer.Model;

namespace CatalogService.DataLayer.Repositories
{
    internal sealed class CategoryRepository : ICategoryRepository
    {
        private readonly ICatalogContext _context;
        private readonly IMapper _mapper;

        public CategoryRepository(ICatalogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public Business.Category AddCategory(Business.Category category)
        {
            var categoryDto =  _mapper.Map<Data.Category>(category);
            var newCategory = _context.Categories.Add(categoryDto);
            _context.SaveChanges();
            return _mapper.Map<Business.Category>(newCategory.Entity);            
        }

        public bool DeleteCategory(int id)
        {
            var category = _context.Categories.FirstOrDefault(c => c.Id == id);
            if (category == null)
            {
                return false;
            }

            _context.Categories.Remove(category);
            _context.SaveChanges();
            return true;
        }

        public List<Business.Category> GetAllCategories()
        {
            return _mapper.Map<List<Business.Category>>(_context.Categories.ToList());
        }

        public Business.Category? GetCategory(int id)
        {
            return _mapper.Map<Business.Category>(_context.Categories.FirstOrDefault(c => c.Id == id));
        }

        public bool UpdateCategory(Business.Category category)
        {
            var entity = _context.Categories.Update(_mapper.Map<Data.Category>(category));
            _context.SaveChanges();
            return entity != null;
        }

        
    }
}
