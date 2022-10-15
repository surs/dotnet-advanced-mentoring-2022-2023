using AutoMapper;
using Business = CatalogService.BusinessLayer.Entities;
using Data = CatalogService.DataLayer.Model;

namespace CatalogService.DataLayer
{
    internal static class EntitiesMapping
    {
        internal static IMapper ConfigureAndCreateMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<string?, Uri?>()
                    .ConvertUsing(s => s != null ? new Uri(s) : null);
                cfg.CreateMap<Uri?, string?>()
                    .ConvertUsing(u => u != null ? u.AbsolutePath : null);
                cfg.CreateMap<Business.Category, Data.Category>()
                    .ReverseMap();
                cfg.CreateMap<Business.Item, Data.Item>()
                    .ReverseMap();                
            });
            return config.CreateMapper();
        }
    }
}
