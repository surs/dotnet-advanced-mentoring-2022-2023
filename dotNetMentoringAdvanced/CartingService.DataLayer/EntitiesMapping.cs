using AutoMapper;
using CartingService.BusinessLayer.Entities;
using CartingService.DataLayer.Dtos;

namespace CartingService.DataLayer
{
    internal static class EntitiesMapping
    {
        internal static IMapper ConfigureAndCreateMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CartAggregate, CartDto>()
                    .ForMember(x => x.Id, o => o.Ignore())
                    .ReverseMap()
                        .ForCtorParam(nameof(CartAggregate.CartKey), o => o.MapFrom(src => src.CartKey))
                        .ForCtorParam(nameof(CartAggregate.CartItems), o => o.MapFrom(src => src.CartItems));
                cfg.CreateMap<CartItem, CartItemDto>().ReverseMap();
                cfg.CreateMap<Item, ItemDto>()
                    .ReverseMap();
                cfg.CreateMap<Image, ImageDto>().ReverseMap();

            });
            config.AssertConfigurationIsValid();

            return new Mapper(config);
        }
    }
}
