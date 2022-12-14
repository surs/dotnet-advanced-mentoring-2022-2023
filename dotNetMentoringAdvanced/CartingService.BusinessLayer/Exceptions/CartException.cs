namespace CartingService.BusinessLayer.Exceptions
{
    public class CartException : Exception
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

    }
}
