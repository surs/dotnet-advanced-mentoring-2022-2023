using BusinessLayer;
using BusinessLayer.Entities;
using DataLayer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using BusinessLayer.Interfaces;
using Newtonsoft.Json;

using IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((context, services) =>
    {
        services
        .RegisterBusinessLayer()
        .RegisterDataLayer(context.Configuration);
    })
    .Build();

var cartingService = host.Services.GetService<ICartingService>();
if (cartingService == null)
{
    return;
}

Console.WriteLine("Creating cart with id 1...");
cartingService.CreateCart(1);
Console.WriteLine("Adding itemks to cart...");
var item1 = new Item(1, "Apple", null, 1.00M);
var item2 = new Item(2, "Orange", new Image("url", "alt"), 1.99M);
cartingService.AddItemToCart(1, item1, 2);
cartingService.AddItemToCart(1, item2, 3);

GetCartItems(cartingService);
Console.WriteLine("Removing an apple...");
cartingService.RemoveItemFromCart(1, item1, 1);
GetCartItems(cartingService);
Console.WriteLine("Removing all oranges...");
cartingService.RemoveItemFromCart(1, item2, 3);
GetCartItems(cartingService);

static void GetCartItems(ICartingService? cartingService)
{
    Console.WriteLine("Getting cart items...");
    var items = cartingService?.GetCartItems(1);
    var serializedItems = JsonConvert.SerializeObject(items);
    Console.WriteLine(serializedItems);
}