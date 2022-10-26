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

        [HttpPost]
        public IActionResult AddItem(Guid cartKey, [FromBody] CartItem item)
        {
            _cartingService.CreateCart(cartKey);
            _cartingService.AddItemToCart(cartKey, item.Item, item.Quantity);
            return Ok();
        }

        [HttpDelete]
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
