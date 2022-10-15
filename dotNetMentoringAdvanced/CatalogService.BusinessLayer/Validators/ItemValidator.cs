using CatalogService.BusinessLayer.Entities;
using FluentValidation;

namespace CatalogService.BusinessLayer.Validators
{
    internal sealed class ItemValidator : AbstractValidator<Item>
    {
        public ItemValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(50);
            RuleFor(x => x.Category).NotEmpty();
            RuleFor(x => x.Price).GreaterThanOrEqualTo(0);
            RuleFor(x => x.Amount).GreaterThanOrEqualTo(0);
        }
    }
}
