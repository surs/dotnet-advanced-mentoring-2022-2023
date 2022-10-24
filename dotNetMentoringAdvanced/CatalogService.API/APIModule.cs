using CatalogService.BusinessLayer;
using CatalogService.DataLayer;

namespace CatalogService.API
{
    internal static class APIModule
    {
        public static IServiceCollection RegisterDependencies(this IServiceCollection services)
        {
            services
                .RegisterBusinessLayer()
                .RegisterDataLayer();

            return services;
        }
    }
}
