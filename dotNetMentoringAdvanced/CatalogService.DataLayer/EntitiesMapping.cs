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
                cfg.ShouldUseConstructor = ctor => ctor.IsConstructor;
                cfg.CreateMap<string?, Uri?>()
                    .ConvertUsing(s => s != null ? new Uri(s) : null);
                cfg.CreateMap<Uri?, string?>()
                    .ConvertUsing(u => u != null ? u.AbsolutePath : null);

                cfg.CreateMap<Business.Category, Data.Category>();


                cfg.CreateMap<Data.Category, Business.Category>()

                    .ForCtorParam(nameof(Business.Category.Id), o => o.MapFrom(s => s.Id))
                    .ForCtorParam(nameof(Business.Category.Name), o => o.MapFrom(s => s.Name))
                    .ForCtorParam(nameof(Business.Category.Image), o => o.MapFrom(s => s.ImageUrl))
                    .ForCtorParam(nameof(Business.Category.ParentCategory), o => o.MapFrom(s => s.ParentCategory));

                cfg.CreateMap<Business.Item, Data.Item>()
                    .ForMember(i => i.CategoryId, o => o.MapFrom(s => s.Category.Id))
                    .ForMember(i => i.Category, o => o.Ignore());

                cfg.CreateMap<Data.Item, Business.Item>()
                        .ForCtorParam(nameof(Business.Item.Id), o => o.MapFrom(s => s.Id))
                        .ForCtorParam(nameof(Business.Item.Name), o => o.MapFrom(s => s.Name))
                        .ForCtorParam(nameof(Business.Item.Description), o => o.MapFrom(s => s.Description))
                        .ForCtorParam(nameof(Business.Item.Image), o => o.MapFrom(s => s.ImageUrl))
                        .ForCtorParam(nameof(Business.Item.Category), o => o.MapFrom(s => s.Category))
                        .ForCtorParam(nameof(Business.Item.Price), o => o.MapFrom(s => s.Price))
                        .ForCtorParam(nameof(Business.Item.Amount), o => o.MapFrom(s => s.Amount));
            });
            return config.CreateMapper();
        }
    }
}
