using CatalogService.BusinessLayer;
using CatalogService.DataLayer;
using CatalogService.Exchange;

namespace CatalogService.API
{
    internal static class APIModule
    {
        public static IServiceCollection RegisterDependencies(this IServiceCollection services)
        {
            services
                .RegisterBusinessLayer()
                .RegisterDataLayer()
                .RegisterExchange();

            return services;
        }
    }
}
