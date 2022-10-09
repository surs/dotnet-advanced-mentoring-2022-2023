using BusinessLayer.Interfaces;
using BusinessLayer.Services;
using Microsoft.Extensions.DependencyInjection;

namespace BusinessLayer
{
    public static class BusinesLayerModule
    {
        public static IServiceCollection RegisterBusinessLayer(this IServiceCollection services)
        {
            services
                .AddTransient<ICartingService, CartingService>();
            return services;
        }
    }
}
