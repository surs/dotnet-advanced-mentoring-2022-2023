using System.ComponentModel.DataAnnotations.Schema;

namespace CatalogService.DataLayer.Model
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? ImageUrl { get; set; }
        public int? ParentCategoryId { get; set; }
        public Category? ParentCategory { get; set; }

    }
}