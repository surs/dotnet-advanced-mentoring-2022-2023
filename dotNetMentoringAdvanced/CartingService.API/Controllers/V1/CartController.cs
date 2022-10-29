using CartingService.BusinessLayer.Entities;
using CartingService.BusinessLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace CartingService.API.Controllers.V1
{
    [Route("v1/[controller]")]
    public class CartController : Controller
    {
        private readonly ICartingService _cartingService;

        public CartController(ICartingService cartingService)
        {
            _cartingService = cartingService;
        }

        /// <summary>
        /// Retireve cart (its key) and its items.
        /// </summary>
        /// <param name="cartKey">Cart's key (GUID)</param>
        /// <returns>Cart with its items.</returns>
        [HttpGet]
        public IActionResult GetCart(Guid cartKey)
        {
            var result = new
            {
                CartKey = cartKey,
                Items = _cartingService.GetCartItems(cartKey)
            };
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
            _cartingService.CreateCart(cartKey);
            _cartingService.AddItemToCart(cartKey, item.Item, item.Quantity);
            return Ok();
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
        public IActionResult RemoveItem(Guid cartKey, int itemId)
        {
            try
            {
                _cartingService.RemoveItemFromCart(cartKey, itemId, 1);
                return Ok();
            }
            catch (BusinessLayer.Exceptions.CartException)
            {
                return NotFound();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
