using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using CatalogService.BusinessLayer;
using CatalogService.DataLayer;

using IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((context, services) =>
    {
        services
        .RegisterBusinessLayer()
        .RegisterDataLayer();
    })
    .Build();


