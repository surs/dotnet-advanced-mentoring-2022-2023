using CatalogService.DataLayer.Model;
using Microsoft.EntityFrameworkCore;

namespace CatalogService.DataLayer.Interfaces
{
    internal interface ICatalogContext
    {
        public DbSet<Category>? Categories { get; }
        public DbSet<Item>? Items { get; }
        void SaveChanges();
    }
}
