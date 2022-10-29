using CartingService.BusinessLayer;
using CartingService.DataLayer;
using V1 = CartingService.API.Controllers.V1;
using V2 = CartingService.API.Controllers.V2;

namespace CartingService.API
{
    internal static class APIModule
    {
        public static IServiceCollection RegisterDependencies(this IServiceCollection services)
        {
            services
                .RegisterBusinessLayer()
                .RegisterDataLayer()
                .RegisterApiLayer();

            return services;
        }

        public static IServiceCollection RegisterApiLayer(this IServiceCollection services)
        {
            services.AddSingleton<V1.CartController>();
            services.AddSingleton<V2.CartController>();

            return services;
        }
    }
}
