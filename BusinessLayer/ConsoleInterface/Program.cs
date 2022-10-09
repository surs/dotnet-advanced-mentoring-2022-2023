using BusinessLayer;
using DataLayer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

using IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((context,services) =>
    {
        services
        .RegisterBusinessLayer()
        .RegisterDataLayer(context.Configuration);  
    })
    .Build();

var config = host.Services.GetService<IConfiguration>();
Console.WriteLine(config.GetValue<string>("ConnectionString"));
Console.ReadKey();