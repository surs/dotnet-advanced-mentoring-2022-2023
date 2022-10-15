﻿using CatalogService.BusinessLayer.Interfaces;
using CatalogService.BusinessLayer.Services;
using Microsoft.Extensions.DependencyInjection;

namespace CatalogService.BusinessLayer
{
    public static class BusinessLayerModule
    {
        public static IServiceCollection RegisterBusinessLayer(this IServiceCollection services)
        {
            services.AddTransient<ICategoryService, CategoryService>();
            services.AddTransient<IItemService, ItemService>();

            return services;
        }
    }
}
