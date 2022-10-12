using AutoMapper;
using CartingService.BusinessLayer.Interfaces;
using DataLayer.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace DataLayer
{
    public static class DataLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services)
        {
            services.AddTransient<ICartRepository, CartRepository>();
            services.AddSingleton<IMapper>(_ => EntitiesMapping.ConfigureAndCreateMapper());

            return services;
        }
    }
}
