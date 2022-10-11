using BusinessLayer.Entities;
using FluentValidation;

namespace BusinessLayer.Validators
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
