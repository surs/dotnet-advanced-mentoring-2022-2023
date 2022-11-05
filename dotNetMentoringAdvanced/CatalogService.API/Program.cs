using CatalogService.API;
using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.Exchange.Interfaces;

var getSingleResource = new Func<int, string, string>((id, singleItemPath) => singleItemPath.Replace("{id}", id.ToString()));

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.RegisterDependencies();

var app = builder.Build();

var messagingService = app.Services.GetService<IItemMessagingService>();
messagingService.Start();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

const string categories = "/categories";
const string singleCategory = categories + "/{id}";
const string items = "/items";
const string singleItem = items + "/{id}";

app.MapGet(categories, (ICategoryService categoryService) =>
{
    var result = categoryService.GetCategories().Select(c => new { Category = c, href = getSingleResource(c.Id, singleCategory) });
    return Results.Ok(result);
});

app.MapPost(categories, (Category category, ICategoryService categoryService) =>
{
    try
    {
        var result = categoryService.AddCategory(category.Name, category.Image, category.ParentCategory);
        var path = getSingleResource(category.Id, singleCategory);
        return Results.Created(path, result);
    }
    catch(Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.MapPut(singleCategory, (int id, Category category, ICategoryService categoryService) =>
{
    try
    {
        categoryService.UpdateCategory(id, category.Name, category.Image, category.ParentCategory);
        return Results.Ok();
    }
    catch (CatalogException e)
    {
        return Results.NotFound();
    }
    catch (Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.MapDelete(singleCategory, (int id, ICategoryService categoryService) =>
{
    try
    {
        categoryService.DeleteCategory(id);
        return Results.Ok();
    }
    catch (CatalogException)
    {
        return Results.NotFound();
    }
    catch (Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.MapGet(items, (IItemService itemService) =>
{
    var result = itemService.GetItems().Select(i => new { Item = i, href = getSingleResource(i.Id, singleItem) });
    return Results.Ok(result);
});

app.MapPost(items, (Item item, IItemService itemService) =>
{
    try
    {
        var result = itemService.AddItem(item.Name, item.Description,
            item.Image, item.Category, item.Price, item.Amount);
        var path = getSingleResource(result.Id, singleItem);
        return Results.Created(path, result);
    }
    catch(Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.MapPut(singleItem, (int id, Item item, IItemService itemService) =>
{
    try
    {
        itemService.UpdateItem(id, item.Name, item.Description,
            item.Image, item.Category, item.Price, item.Amount);
        return Results.Ok();
    }
    catch (CatalogException e)
    {
        return Results.NotFound();
    }
    catch (Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.MapDelete(singleItem, (int id, IItemService itemService) =>
{
    try
    {
        itemService.DeleteItem(id);
        return Results.Ok();
    }
    catch (CatalogException e)
    {
        return Results.NotFound();
    }
    catch (Exception e)
    {
        return Results.BadRequest(e);
    }
});

app.Run();