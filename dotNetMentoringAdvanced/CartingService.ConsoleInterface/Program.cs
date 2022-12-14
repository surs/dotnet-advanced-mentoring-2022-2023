using CartingService.BusinessLayer.Entities;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;
using CartingService.BusinessLayer;
using CartingService.BusinessLayer.Interfaces;
using CartingService.DataLayer;

using IHost host = Host.CreateDefaultBuilder(args)
    .ConfigureServices((context, services) =>
    {
        services
        .RegisterBusinessLayer()
        .RegisterDataLayer();
    })
    .Build();

var cartingService = host.Services.GetService<ICartingService>();
if (cartingService == null)
{
    return;
}

var cartId = Guid.NewGuid();
Console.WriteLine("Creating cart with id 1...");
cartingService.CreateCart(cartId);
Console.WriteLine("Adding itemks to cart...");
var item1 = new Item(1, "Apple", null, 1.00M);
var item2 = new Item(2, "Orange", new Image("url", "alt"), 1.99M);
cartingService.AddItemToCart(cartId, item1, 2);
cartingService.AddItemToCart(cartId, item2, 3);

GetCartItems(cartingService, cartId);
Console.WriteLine("Removing an apple..."); 
cartingService.RemoveItemFromCart(cartId, item1, 1);
GetCartItems(cartingService, cartId);
Console.WriteLine("Removing all oranges...");
cartingService.RemoveItemFromCart(cartId, item2, 3);
GetCartItems(cartingService, cartId);

cartingService.RemoveItemFromCart(cartId, item1, 2);

static void GetCartItems(ICartingService? cartingService, Guid cartKey)
{
    Console.WriteLine("Getting cart items...");
    var items = cartingService?.GetCartItems(cartKey);
    var serializedItems = JsonConvert.SerializeObject(items);
    Console.WriteLine(serializedItems);
}