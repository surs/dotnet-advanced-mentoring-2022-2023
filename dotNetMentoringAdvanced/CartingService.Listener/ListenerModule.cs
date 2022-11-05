
using Microsoft.Extensions.DependencyInjection;

namespace CartingService.Listener
{
    public static class ListenerModule
    {
        public static IServiceCollection RegisterListener(this IServiceCollection services)
        {
            services.AddSingleton<IMessagingConfiguration, MessagingConfiguration>();
            services.AddSingleton<IItemChangedListener, ItemChangedListener>();
            return services;
        }
    }
}
