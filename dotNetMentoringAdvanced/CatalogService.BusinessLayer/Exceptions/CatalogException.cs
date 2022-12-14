namespace CatalogService.BusinessLayer.Exceptions
{
    public class CatalogException : Exception
    {
        internal static CatalogException CategoryNotFound => new CatalogException("Category not found");
        internal static CatalogException ItemNotFound => new CatalogException("Item not found");

        public CatalogException(string? message, Exception? innerException) : base(message, innerException)
        {

        }

        public CatalogException(string? message) : base(message)
        {

        }

        public CatalogException() : base()
        {

        }

    }
}
