using System.Runtime.Serialization;

namespace CatalogService.BusinessLayer.Exceptions
{
    [Serializable]
    public class CatalogException : Exception, ISerializable
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

        public CatalogException(SerializationInfo info, StreamingContext context)
        {
            base.GetObjectData(info, context);
        }

    }
}
