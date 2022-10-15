using CatalogService.BusinessLayer.Entities;
using FluentValidation;

namespace CatalogService.BusinessLayer.Validators
{
    internal sealed class CategoryValidator : AbstractValidator<Category>
    {
        public CategoryValidator()
        {
            RuleFor(c => c.Name).NotEmpty().MaximumLength(50);
        }
    }
}
