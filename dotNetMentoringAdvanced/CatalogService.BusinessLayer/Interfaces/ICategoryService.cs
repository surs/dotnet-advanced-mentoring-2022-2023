using CatalogService.BusinessLayer.Entities;

namespace CatalogService.BusinessLayer.Interfaces
{
    public interface ICategoryService
    {
        List<Category> GetCategories();
        Category GetCategory(int id);
        Category AddCategory(Category category);
        Category AddCategory(string name, Uri? image, Category? parentCategory);
        void UpdateCategory(int id, string name, Uri? image, Category? parentCategory);
        void DeleteCategory(int id);
    }
}
