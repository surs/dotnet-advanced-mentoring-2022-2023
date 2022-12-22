using System.Runtime.Serialization;

namespace CartingService.BusinessLayer.Exceptions
{
    [Serializable]
    public sealed class CartException : Exception
    {
        internal static CartException CartNotFound => new CartException("Cart not found");

        public CartException(string? message, Exception? innerException) : base(message, innerException)
        {

        }

        public CartException(string? message) : base(message)
        {

        }

        public CartException() : base()
        {

        }

        private CartException(SerializationInfo info, StreamingContext context) : base(info, context)
        {

        }
    }
}
