using CatalogService.API;
using CatalogService.BusinessLayer.Entities;
using CatalogService.BusinessLayer.Exceptions;
using CatalogService.BusinessLayer.Interfaces;
using CatalogService.Exchange.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;

var getSingleResource = new Func<int, string, string>((id, singleItemPath) => singleItemPath.Replace("{id}", id.ToString()));

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen( options =>
{
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = Microsoft.OpenApi.Models.ParameterLocation.Header,
        Description = "JSON Web Token based security"
    });
    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme { Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer"}}, new string[] { }
        }
    });
});

builder.Services.RegisterDependencies();

builder.Services.AddAuthentication("Bearer")
    .AddJwtBearer("Bearer", options =>
    {
        options.Authority = "https://localhost:5001";
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateAudience = false
        };
    });
builder.Services.AddAuthorization();
builder.Services.AddApplicationInsightsTelemetry(options =>
{
    options.ConnectionString = builder.Configuration["APPLICATIONINSIGHTS_CONNECTION_STRING"];
});

var app = builder.Build();

var messagingService = app.Services.GetService<IItemMessagingService>();
messagingService?.Start();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();

const string categories = "/categories";
const string singleCategory = categories + "/{id}";
const string items = "/items";
const string singleItem = items + "/{id}";

app.MapGet(categories, (ICategoryService categoryService) =>
{
    var result = categoryService.GetCategories().Select(c => new { Category = c, href = getSingleResource(c.Id, singleCategory) });
    return Results.Ok(result);
});

app.MapPost(categories, [Authorize(Roles = Roles.Manager)] (Category category, ICategoryService categoryService) =>
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

app.MapPut(singleCategory, [Authorize(Roles = Roles.Manager)] (int id, Category category, ICategoryService categoryService) =>
{
    try
    {
        categoryService.UpdateCategory(id, category.Name, category.Image, category.ParentCategory);
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

app.MapDelete(singleCategory, [Authorize(Roles = Roles.Manager)] (int id, ICategoryService categoryService) =>
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

app.MapGet(singleItem + "/properties", (int id) =>
{
    var result = new Dictionary<string, string>
    {
        { "Color", "Red" },
        { "Size", "L" }
    };

    return Results.Ok(result);
});

app.MapPost(items, [Authorize(Roles = Roles.Manager)] (Item item, IItemService itemService) =>
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

app.MapGet(singleItem, (int id, IItemService itemService) =>
{
    try
    {
        var item = itemService.GetItem(id);
        return Results.Ok(item);
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

app.MapPut(singleItem, ([FromRoute] int id, [FromBody] Item item, HttpRequest request, IItemService itemService) =>
{
    try
    {
        var haveCorrelation = request.Headers.TryGetValue("Correlation-Context", out var correlation);
        itemService.UpdateItem(id, item.Name, item.Description,
            item.Image, item.Category, item.Price, item.Amount, haveCorrelation ? correlation : string.Empty);
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

app.MapDelete(singleItem, [Authorize(Roles = Roles.Manager)] (int id, IItemService itemService) =>
{
    try
    {
        itemService.DeleteItem(id);
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

app.Run();