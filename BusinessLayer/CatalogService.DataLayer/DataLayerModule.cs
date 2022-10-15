using AutoMapper;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.DataLayer.Interfaces;
using CatalogService.DataLayer.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace CatalogService.DataLayer
{
    public static class DataLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services)
        {
            services.AddDbContext<ICatalogContext, CatalogContext>();
            services.AddTransient<ICategoryRepository, CategoryRepository>();
            services.AddTransient<IItemRepository, ItemRepository>();
            services.AddSingleton<IMapper>(_ => EntitiesMapping.ConfigureAndCreateMapper());
            return services;
        }
    }
}
