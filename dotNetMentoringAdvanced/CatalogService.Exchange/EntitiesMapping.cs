using AutoMapper;
using Business = CatalogService.BusinessLayer.Entities;
using Data = CatalogService.Exchange.Dtos;

namespace CatalogService.Exchange
{
    internal static class EntitiesMapping
    {
        internal static IMapper ConfigureAndCreateMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.ShouldUseConstructor = ctor => ctor.IsConstructor;
                cfg.CreateMap<string?, Uri?>()
                    .ConvertUsing(s => s != null ? new Uri(s) : null);
                cfg.CreateMap<Uri?, string?>()
                    .ConvertUsing(u => u != null ? u.AbsolutePath : null);

                cfg.CreateMap<Business.Item, Data.ItemDto>()
                    .ForMember(i => i.CategoryId, o => o.MapFrom(s => s.Category.Id));
            });
            return config.CreateMapper();
        }
    }
}
