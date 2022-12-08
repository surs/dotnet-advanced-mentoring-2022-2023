using CatalogService.Exchange.Interfaces;
using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.Extensions.DependencyInjection;

namespace CatalogService.Exchange
{
    public static class ExchangeModule
    {
        public static IServiceCollection RegisterExchange(this IServiceCollection services)
        {
            services.AddSingleton<IMessagingConfiguration, MessagingConfiguration>();
            services.AddSingleton<IItemMessagingService, ItemMessagingService>();
            services.AddSingleton<TelemetryClient>(provider =>
            {
                TelemetryConfiguration configuration = TelemetryConfiguration.CreateDefault();
                configuration.ConnectionString = "InstrumentationKey=xxxxxx;IngestionEndpoint=https://westeurope-5.in.applicationinsights.azure.com/;LiveEndpoint=https://westeurope.livediagnostics.monitor.azure.com/";
                return new TelemetryClient(configuration);
            });
            return services;
        }
    }
}
