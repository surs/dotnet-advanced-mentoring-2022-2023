using CatalogService.BusinessLayer.Validators;
using FluentValidation;

namespace CatalogService.BusinessLayer.Entities
{
    public record Item(int Id, string Name, string? Description, 
        Uri? Image, Category Category, decimal Price, int Amount)
    {
        internal static IValidator<Item> Validator => new ItemValidator();
    }
}
