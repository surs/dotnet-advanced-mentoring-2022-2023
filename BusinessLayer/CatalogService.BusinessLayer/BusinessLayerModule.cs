using CatalogService.BusinessLayer.Interfaces;
using CatalogService.BusinessLayer.Services;
using Microsoft.Extensions.DependencyInjection;

namespace CartingService.DataLayer
{
    public static class BusinessLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services)
        {
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IItemService, ItemService>();

            return services;
        }
    }
}
