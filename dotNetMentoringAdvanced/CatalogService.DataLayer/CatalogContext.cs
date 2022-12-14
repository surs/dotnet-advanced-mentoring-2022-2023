using CatalogService.DataLayer.Interfaces;
using CatalogService.DataLayer.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace CatalogService.DataLayer
{
    internal sealed class CatalogContext : DbContext, ICatalogContext
    {
        private readonly string _connectionString;

        public DbSet<Category> Categories { get; set; }
        public DbSet<Item> Items { get; set; }

        public CatalogContext(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("CatalogDB");
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlite(_connectionString);
        }

        void ICatalogContext.SaveChanges()
        {
            SaveChanges();
        }
    }
}