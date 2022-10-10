using AutoMapper;
using BusinessLayer.Interfaces;
using DataLayer.Repositories;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public static class DataLayerModule
    {
        public static IServiceCollection RegisterDataLayer(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddTransient<ICartRepository, CartRepository>();
            services.AddSingleton<IMapper>(_ => EntitiesMapping.ConfigureAndCreateMapper());

            return services;
        }
    }
}
