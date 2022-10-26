using CartingService.BusinessLayer;
using CartingService.DataLayer;

namespace CartingService.API
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
