using CartingService.BusinessLayer.Interfaces;
using Microsoft.Extensions.DependencyInjection;

namespace CartingService.BusinessLayer
{
    public static class BusinesLayerModule
    {
        public static IServiceCollection RegisterBusinessLayer(this IServiceCollection services)
        {
            services
                .AddTransient<ICartingService, Services.CartingService>();
            return services;
        }
    }
}
