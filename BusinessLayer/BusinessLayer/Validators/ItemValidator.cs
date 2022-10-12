using CartingService.BusinessLayer.Entities;
using FluentValidation;

namespace CartingService.BusinessLayer.Validators
{
    internal class ItemValidator : AbstractValidator<Item>
    {
        public ItemValidator()
        {
            RuleFor(x => x.Name).NotEmpty();
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Price).NotEmpty();
        }
    }
}
