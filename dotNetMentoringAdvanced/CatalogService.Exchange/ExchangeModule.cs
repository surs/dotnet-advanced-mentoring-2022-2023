using CatalogService.Exchange.Interfaces;
using Microsoft.Extensions.DependencyInjection;

namespace CatalogService.Exchange
{
    public static class ExchangeModule
    {
        public static IServiceCollection RegisterExchange(this IServiceCollection services)
        {
            services.AddSingleton<IMessagingConfiguration, MessagingConfiguration>();
            services.AddSingleton<IItemMessagingService, ItemMessagingService>();
            return services;
        }
    }
}
