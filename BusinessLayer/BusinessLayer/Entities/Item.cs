using BusinessLayer.Validators;
using FluentValidation;

namespace BusinessLayer.Entities
{
    public sealed record Item(int Id, string Name, Image? Image, decimal Price)
    {
        internal static IValidator<Item> Validator => new ItemValidator();
    }
}

