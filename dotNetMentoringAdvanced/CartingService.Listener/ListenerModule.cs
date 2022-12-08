
using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.Extensions.DependencyInjection;

namespace CartingService.Listener
{
    public static class ListenerModule
    {
        public static IServiceCollection RegisterListener(this IServiceCollection services)
        {
            services.AddSingleton<IMessagingConfiguration, MessagingConfiguration>();
            services.AddSingleton<IItemChangedListener, ItemChangedListener>();
            services.AddSingleton<TelemetryClient>(provider =>
            {
                TelemetryConfiguration configuration = TelemetryConfiguration.CreateDefault();
                configuration.ConnectionString = "InstrumentationKey=xxxxxxx;IngestionEndpoint=https://westeurope-5.in.applicationinsights.azure.com/;LiveEndpoint=https://westeurope.livediagnostics.monitor.azure.com/";
                return new TelemetryClient(configuration);
            });
            return services;
        }
    }
}
