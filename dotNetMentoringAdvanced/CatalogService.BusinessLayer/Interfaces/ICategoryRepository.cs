using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface ICategoryRepository
    {
        Category? GetCategory(int id);
        List<Category> GetAllCategories();
        Category AddCategory(Category category);
        bool UpdateCategory(Category category);
        bool DeleteCategory(int id);        
    }
}
