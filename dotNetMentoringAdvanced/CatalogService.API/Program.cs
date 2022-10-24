using CatalogService.API;
using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.RegisterDependencies();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

var summaries = new[]
{
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};

const string categories = "/categories";
const string singleCategory = categories + "/{id}";
const string items = "/items";
const string singleItem = items + "/{id}";

app.MapGet(categories, (ICategoryService categoryService) =>
{
    var result = categoryService.GetCategories();
    return result;
});

app.MapPost(categories, (Category category, ICategoryService categoryService) =>
{
    try
    {
        var result = categoryService.AddCategory(category.Name, category.Image, category.ParentCategory);
        var path = singleCategory.Replace("{id}", result.Id.ToString());
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


app.MapGet("/weatherforecast", () =>
{
    var forecast = Enumerable.Range(1, 5).Select(index =>
       new WeatherForecast
       (
           DateTime.Now.AddDays(index),
           Random.Shared.Next(-20, 55),
           summaries[Random.Shared.Next(summaries.Length)]
       ))
        .ToArray();
    return forecast;
})
.WithName("GetWeatherForecast");

app.Run();

internal record WeatherForecast(DateTime Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}