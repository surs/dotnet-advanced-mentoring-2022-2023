using CatalogService.BusinessLayer.Interfaces;
using CatalogService.BusinessLayer.Services;
using CatalogService.DataLayer.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace CatalogService.DataLayer
{
    public static class DataLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services)
        {
            services.AddDbContext<CatalogContext>();
            services.AddTransient<ICategoryRepository, CategoryRepository>();
            services.AddTransient<IItemRepository, ItemRepository>();
            return services;
        }
    }
}
