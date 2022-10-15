using CatalogService.BusinessLayer.Validators;
using FluentValidation;

namespace CatalogService.BusinessLayer.Entities
{
    public record Category(int Id, string Name, Uri? Image, Category? ParentCategory)
    {
        internal static IValidator<Category> Validator => new CategoryValidator();
    }
}
