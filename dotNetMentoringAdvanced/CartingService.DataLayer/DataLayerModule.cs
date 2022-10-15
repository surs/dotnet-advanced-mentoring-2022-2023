using CartingService.BusinessLayer.Interfaces;
using CartingService.DataLayer.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace CartingService.DataLayer
{
    public static class DataLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services)
        {
            services.AddTransient<ICartRepository, CartRepository>();
            services.AddSingleton(_ => EntitiesMapping.ConfigureAndCreateMapper());

            return services;
        }
    }
}
