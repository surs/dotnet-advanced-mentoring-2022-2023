using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;

namespace CatalogService.BusinessLayer.Services
{
    internal sealed class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryService(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public Category AddCategory(Category category)
        {
            FluentValidation.Results.ValidationResult validationResult = Category.Validator.Validate(category);
            if (!validationResult.IsValid)
            {
                throw new CatalogException(string.Join(Environment.NewLine, validationResult.Errors.Select(e => e.ErrorMessage)));
            }

            return _categoryRepository.AddCategory(category);
        }

        public Category AddCategory(string name, Uri image, Category parentCategory)
        {
            var category = new Category(0, name, image, parentCategory);
            return AddCategory(category);
        }

        public void DeleteCategory(int id)
        {
            var deleted = _categoryRepository.DeleteCategory(id);
            if (!deleted)
            {
                throw CatalogException.CategoryNotFound;
            }
        }

        public List<Category> GetCategories()
        {
            return _categoryRepository.GetAllCategories();
        }

        public Category GetCategory(int id)
        {
            var category = _categoryRepository.GetCategory(id);
            if (category == null)
            {
                throw CatalogException.CategoryNotFound;
            }

            return category;
        }

        public void UpdateCategory(int id, string name, Uri? image, Category parentCategory)
        {
            var category = new Category(id, name, image, parentCategory);
            _categoryRepository.UpdateCategory(category);
        }
    }
}
