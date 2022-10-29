using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CartingService.API.Controllers.V2
{
    [Route("v2/[controller]")]
    public class CartController : Controller
    {
        private readonly ICartingService _cartingService;
        private readonly V1.CartController _cartControllerV1;

        public CartController(ICartingService cartingService, V1.CartController cartControllerV1)
        {
            _cartingService = cartingService;
            _cartControllerV1 = cartControllerV1;
        }

        /// <summary>
        /// Retireve cart items.
        /// </summary>
        /// <param name="cartKey">Cart's key (GUID)</param>
        /// <returns>Cart's items.</returns>
        [HttpGet]
        public IActionResult GetCart(Guid cartKey)
        {
            var result = _cartingService.GetCartItems(cartKey);
            return Ok(result);
        }

        /// <summary>
        /// Adds item to the cart
        /// </summary>
        /// <param name="cartKey">Cart's key (GUID)</param>
        /// <param name="item">Item and quantity to be added to the cart</param>
        [HttpPost]
        public IActionResult AddItem(Guid cartKey, [FromBody] CartItem item)
        {
            return _cartControllerV1.AddItem(cartKey, item);
        }

        /// <summary>
        /// Removes one item from cart.
        /// </summary>
        /// <param name="cartKey">Cart's key (GUID)</param>
        /// <param name="itemId">Item's id</param>
        /// <remarks>
        /// When last item is removed, so is the cart.
        /// </remarks>
        [HttpDelete]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [HttpDelete]
        public IActionResult RemoveItem(Guid cartKey, int itemId)
        {
            return _cartControllerV1.RemoveItem(cartKey, itemId);
        }
    }
}
